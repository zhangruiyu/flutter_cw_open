import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:url_launcher/url_launcher.dart';
import '../../../../routes.dart';
import 'action.dart';
import 'state.dart';

Effect<BannerState> buildEffect() {
  return combineEffects(<Object, Effect<BannerState>>{
    BannerAction.SkipWebViewPage: _onSkipWebViewPage,
  });
}

void _onSkipWebViewPage(Action action, Context<BannerState> ctx) {
  AliProductItem itemBanner = action.payload;
  Navigator.pushNamed(ctx.context, PageConstants.ProductDetailsPage,
      arguments: {"data": itemBanner});
}
