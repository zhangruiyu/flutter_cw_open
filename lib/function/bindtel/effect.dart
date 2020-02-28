import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/auto/model/login_entity.dart';
import 'package:chongmeng/global_store/action.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<BindTelState> buildEffect() {
  return combineEffects(<Object, Effect<BindTelState>>{
    BindTelAction.SendAutoCode: _onSendAutoCode,
    BindTelAction.Login: _onLogin,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<BindTelState> ctx) {
  var textChangeListener = () {
    ctx.dispatch(BindTelActionCreator.onCheckOK(
        ctx.state.telTextEditingController.text.length == 11 &&
            ctx.state.autoCodeTextEditingController.text.length == 6));
  };

  ctx.state.telTextEditingController.addListener(textChangeListener);
  ctx.state.autoCodeTextEditingController.addListener(textChangeListener);
}

Future _onSendAutoCode(Action action, Context<BindTelState> ctx) async {
  var result = await RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.SendThirdLoginCode,
      queryParameters: {'tel': ctx.state.telTextEditingController.text},
      showLoadingIndicator: true);
  if (result.hasSuccess) {
    action.payload['completer']();
  }
}

Future _onLogin(Action action, Context<BindTelState> ctx) async {
  //第三方登录的参数
  Map<String, dynamic> queryParameters = ctx.state.queryParameters;
  queryParameters
    ..['tel'] = ctx.state.telTextEditingController.text
    ..['autoCode'] = ctx.state.autoCodeTextEditingController.text;
  Result<LoginEntity> result = await RequestClient.request<LoginEntity>(
      ctx.context, HttpConstants.ThirdLoginAndRegister,
      queryParameters: queryParameters, showLoadingIndicator: true);
  if (result.hasSuccess) {
    UserHelper.loginNoPop(result.data.data, ctx.context);
    NavigatorHelper.popToMain(ctx.context);
  }
}
