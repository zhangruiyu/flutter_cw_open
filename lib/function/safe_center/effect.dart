import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:umengshare/umengshare.dart';
import 'action.dart';
import 'model/safe_entity.dart';
import 'state.dart';

Effect<SafeCenterState> buildEffect() {
  return combineEffects(<Object, Effect<SafeCenterState>>{
    SafeCenterAction.BindAndUnBind: _onBindAndUnBind,
    SafeCenterAction.Refresh: _onRefresh,
  });
}

Future _onRefresh(Action action, Context<SafeCenterState> ctx) async {
  var result = await RequestClient.request<SafeEntity>(
      ctx.context, HttpConstants.SafeState);
  CompleterUtils.complete(action);
  result.yes((value) {
    ctx.dispatch(SafeCenterActionCreator.onResetData(value.data));
  });
}

Future _onBindAndUnBind(Action action, Context<SafeCenterState> ctx) async {
  String type = action.payload;
  String actionType;
  if (type == "qq") {
    actionType = ctx.state.data.isBindQq ? "unbind" : "bind";
  } else if (type == "wechat") {
    actionType = ctx.state.data.isBindWechat ? "unbind" : "bind";
  }
  var result = await RequestClient.request<SafeEntity>(
      ctx.context, HttpConstants.BindQqOrWechat,
      showLoadingIndicator: true,
      queryParameters: {
        'action': actionType,
        'type': type,
        if (actionType == "bind")
          ...(await UMengShare.login(
              action.payload == "qq" ? UMPlatform.QQ : UMPlatform.Wechat))
      });
  result.yes((value) {
    ctx.dispatch(SafeCenterActionCreator.onResetData(value.data));
  });
}
