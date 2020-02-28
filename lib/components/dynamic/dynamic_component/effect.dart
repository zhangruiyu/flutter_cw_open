import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/dynamic_liked_entity.dart';
import 'state.dart';

Effect<DynamicItemState> buildEffect() {
  return combineEffects(<Object, Effect<DynamicItemState>>{
    DynamicItemAction.RequestSetLiked: _onRequestSetLiked,
    DynamicItemAction.SkipReviewPage: _onSkipReviewPage,
    DynamicItemAction.SkipDetailsPage: _onSkipDetailsPage,
  });
}

Future _onRequestSetLiked(Action action, Context<DynamicItemState> ctx) async {
  UserHelper.loginCheck(ctx.context, () async {
    bool isLiked = action.payload['isLiked'];
    //如果是已点赞
    if (!isLiked) {
      ctx.state.data.liked.add(GlobalStore.store.getState().localUser.userId);
    } else {
      ctx.state.data.liked
          .remove(GlobalStore.store.getState().localUser.userId);
    }
    action.payload['completer'](!isLiked);
    var result = await RequestClient.request<DynamicLikedEntity>(
        ctx.context, HttpConstants.DynamicLiked, queryParameters: {
      "liked": isLiked ? 0 : 1,
      "dynamicId": ctx.state.data.id
    });
    if (result.hasSuccess) {
      ctx.dispatch(DynamicItemActionCreator.onResetLiked(
          {"liked": result.data.data.liked, "dynamic_id": ctx.state.data.id}));
    }
  });
}

Future _onSkipReviewPage(Action action, Context<DynamicItemState> ctx) async {
  if (ctx.state.data.images != null && ctx.state.data.images.length > 0) {
    Navigator.pushNamed(ctx.context, PageConstants.ReviewImagePage,
        arguments: {"images": ctx.state.data.images, "index": action.payload});
  } else if (ctx.state.data.video != null) {
    Navigator.pushNamed(ctx.context, PageConstants.ReviewIVPage, arguments: {
      'canSkip': false,
      'filePath': ctx.state.data.video.videoPath,
      'type': "video",
      'videoThumbnail': ctx.state.data.video.videoThumbnailPath,
    });
  }
}

Future _onSkipDetailsPage(Action action, Context<DynamicItemState> ctx) async {
  Navigator.pushNamed(ctx.context, PageConstants.DynamicDetailsPage,
      arguments: {
        'data': ctx.state.data,
      });
}
