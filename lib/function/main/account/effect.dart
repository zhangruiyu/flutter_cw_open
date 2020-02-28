import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/account_entity.dart';
import 'state.dart';

Effect<AccountState> buildEffect() {
  return combineEffects(<Object, Effect<AccountState>>{
    Lifecycle.initState: _initState,
    AccountAction.Refresh: _onRefresh,
  });
}

Future _onRefresh(Action action, Context<AccountState> ctx) async {
  if (UserHelper.isLogin()) {
    var result = await RequestClient.request<AccountEntity>(
        ctx.context, HttpConstants.AccountIndex);
    result.yes((value) {
      ctx.dispatch(AccountActionCreator.onResetData(value.data));
    });
    var allUnreadCount = await jmessage.getAllUnreadCount();
    ctx.dispatch(AccountActionCreator.onResetUnreadCount(allUnreadCount));
  }
}

void _initState(Action action, Context<AccountState> ctx) {
  _onRefresh(action, ctx);
}
