import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/keyboard_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/search_result_entity.dart';
import 'state.dart';

Effect<SearchState> buildEffect() {
  return combineEffects(<Object, Effect<SearchState>>{
    SearchAction.Search: _onSearch,
    SearchAction.Refresh: _onRefresh,
    SearchAction.LoadMore: _onLoadMore,
  });
}

Future _onSearch(Action action, Context<SearchState> ctx) async {
  _onRefresh(action, ctx);
}

Future _onRefresh(Action action, Context<SearchState> ctx) async {
  ctx.dispatch(SearchActionCreator.onSetSearching(true));
  var result = await RequestClient.request<SearchResultEntity>(
      ctx.context, HttpConstants.CoreSearch,
      queryParameters: {
        "query": ctx.state.textEditingController.text,
        'index': 1,
        'filtrateType': ctx.state.searchFiltrateState.type
      });
  //修改刷新后动画
  ctx.dispatch(SearchActionCreator.onSetSearching(false));
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    KeyboardUtils.hideByContext(ctx.context);
    ctx.dispatch(SearchActionCreator.onResetData(result.data.data));
  }
}

Future _onLoadMore(Action action, Context<SearchState> ctx) async {
  var index = ctx.state.index + 1;
  var result = await RequestClient.request<SearchResultEntity>(
      ctx.context, HttpConstants.CoreSearch, queryParameters: {
    "query": ctx.state.textEditingController.text,
    'index': index
  });
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    KeyboardUtils.hideByContext(ctx.context);
    if (result?.data?.data?.isNotEmpty == true)
      ctx.dispatch(SearchActionCreator.onAddData(result.data.data, index));
  }
}
