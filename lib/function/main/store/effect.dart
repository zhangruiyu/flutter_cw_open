import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import '../action.dart';
import 'action.dart';
import 'model/integral_commodity_entity.dart';
import 'state.dart';

Effect<StoreState> buildEffect() {
  return combineEffects(<Object, Effect<StoreState>>{
    StoreAction.Refresh: _onRefresh,
  });
}

Future _onRefresh(Action action, Context<StoreState> ctx) async {
  var result = await RequestClient.request<IntegralCommodityEntity>(
      ctx.context, HttpConstants.StoreCommodityList);
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(StoreActionCreator.onResetPageData(result.data.data));
  }
}
