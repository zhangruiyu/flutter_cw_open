import 'package:chongmeng/routes.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<IntegralItemState> buildEffect() {
  return combineEffects(<Object, Effect<IntegralItemState>>{
    IntegralItemAction.SkipIntegralCommodityDetailPage:
        _onSkipIntegralCommodityDetailPage,
  });
}

void _onSkipIntegralCommodityDetailPage(
    Action action, Context<IntegralItemState> ctx) {
  UserHelper.loginCheck(ctx.context, () {
    Navigator.pushNamed(ctx.context, PageConstants.IntegralCommodityDetailPage,
        arguments: {
          "itemData": ctx.state.itemData,
          "index": ctx.state.index,
        });
  });
}
