import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/integral/model/integral_record_entity.dart';
import 'package:chongmeng/function/integral/model/total_integral_entity.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<IntegralRecordState> buildEffect() {
  return combineEffects(<Object, Effect<IntegralRecordState>>{
    Lifecycle.initState: _initState,
    IntegralRecordAction.Refresh: _onRefresh,
    IntegralRecordAction.LoadMore: _onLoadMore,
  });
}

Future _initState(Action action, Context<IntegralRecordState> ctx) async {
  var result = await RequestClient.request<TotalIntegralEntity>(
    ctx.context,
    HttpConstants.TotalIntegral,
  );

  if (result.hasSuccess) {
    ctx.dispatch(
        IntegralRecordActionCreator.onSetTotalIntegral(result.data.data));
  }
}

Future _onRefresh(Action action, Context<IntegralRecordState> ctx) async {
  var result = await RequestClient.request<IntegralRecordEntity>(
    ctx.context,
    HttpConstants.IntegralList,
    queryParameters: {"pageSize": 20, "pageIndex": 0},
  );
  CompleterUtils.complete(action);

  if (result.hasSuccess) {
    ctx.dispatch(IntegralRecordActionCreator.onAddPageListData({
      'data': result.data.data,
    }));
    ctx.state.easyRefreshController
        .finishLoad(success: true, noMore: result.data.data.length < 20);
  }
}

Future _onLoadMore(Action action, Context<IntegralRecordState> ctx) async {
  var result = await RequestClient.request<IntegralRecordEntity>(
    ctx.context,
    HttpConstants.IntegralList,
    queryParameters: {"pageSize": 20, "pageIndex": ctx.state.index},
  );
  action.payload['completer']();

  if (result.hasSuccess) {
    ctx.state.easyRefreshController
        .finishLoad(success: true, noMore: result.data.data.length < 20);
    ctx.dispatch(IntegralRecordActionCreator.onAddPageMoreListData({
      'data': result.data.data,
    }));
  }
}
