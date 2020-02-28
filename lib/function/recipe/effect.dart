import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/main/community/state.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/recipe_entity.dart';
import 'state.dart';

Effect<RecipeState> buildEffect() {
  return combineEffects(<Object, Effect<RecipeState>>{
    Lifecycle.initState: _initState,
    RecipeAction.Refresh: _onRefresh,
  });
}

void _initState(Action action, Context<RecipeState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as RecipePageState;
  ctx.state
    ..tabController = new TabController(
        vsync: tickerProvider, length: ctx.state.data.length, initialIndex: 0);
}

Future _onRefresh(Action action, Context<RecipeState> ctx) async {
  var result = await RequestClient.request<RecipeEntity>(
      ctx.context, HttpConstants.RecipeList);

  action.payload['completer']();
  if (result.hasSuccess) {
    ctx.dispatch(RecipeActionCreator.onResetData(result.data.data));
  }
}
