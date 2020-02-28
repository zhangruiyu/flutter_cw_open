import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';

Effect<AliProductItem> buildEffect() {
  return combineEffects(<Object, Effect<AliProductItem>>{
    AliItemProductAction.SkipProductDetailsPage: _onSkipProductDetailsPage,
  });
}

void _onSkipProductDetailsPage(Action action, Context<AliProductItem> ctx) {
  Navigator.pushNamed(ctx.context, PageConstants.ProductDetailsPage,
      arguments: {"data": ctx.state});
}
