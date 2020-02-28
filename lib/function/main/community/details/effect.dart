import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/keyboard_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/scheduler.dart';
import 'action.dart';
import 'model/comment_entity.dart';
import 'state.dart';

Effect<DynamicDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<DynamicDetailsState>>{
    DynamicDetailsAction.SkipReviewPage: _onSkipReviewPage,
    DynamicDetailsAction.SelectPic: _onSelectPic,
    DynamicDetailsAction.Commit: _onCommit,
    DynamicDetailsAction.Refresh: _onRefresh,
    DynamicDetailsAction.RequestFocus: _onRequestFocus,
  });
}

Future _onSkipReviewPage(
    Action action, Context<DynamicDetailsState> ctx) async {
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

Future _onRequestFocus(Action action, Context<DynamicDetailsState> ctx) async {
  KeyboardUtils.unfocus(ctx.context);
  FocusScope.of(ctx.context).requestFocus(ctx.state.commentNode);
}

Future _onSelectPic(Action action, Context<DynamicDetailsState> ctx) async {
  List<String> imgList = await NavigatorHelper.pushFileSelectPageString(
      ctx.context,
      maxSelected: 1);
  if ((imgList?.length ?? 0) > 0) {
    ctx.dispatch(DynamicDetailsActionCreator.onSetPic(imgList.first));
  }
}

Future _onRefresh(Action action, Context<DynamicDetailsState> ctx) async {
  var result = await RequestClient.request<CommentEntity>(
      ctx.context, HttpConstants.CommentList,
      queryParameters: {'momentId': ctx.state.data.id});
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(DynamicDetailsActionCreator.onResetData(result.data.data));
  }
}

Future _onCommit(Action action, Context<DynamicDetailsState> ctx) async {
  if (ctx.state.selectPic != null) {
    NavigatorHelper.showLoadingDialog(ctx.context, true);
    Result<CosEntity> cosEntity = await RequestClient.request<CosEntity>(
        ctx.context, HttpConstants.PeriodEffectiveSign,
        queryParameters: {'type': CosType.PIC_TYPE});
    if (cosEntity.hasSuccess) {
      var resourcePath = await UploadTask(ctx.state.selectPic)
          .uploadByData(cosEntity.data.data);
      NavigatorHelper.showLoadingDialog(ctx.context, false);
      commit(action, ctx, resourcePath: resourcePath);
    } else {
      NavigatorHelper.showLoadingDialog(ctx.context, false);
    }
  } else {
    commit(action, ctx);
  }
}

commit(Action action, Context<DynamicDetailsState> ctx,
    {String resourcePath}) async {
  var result = await RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.CommitComment,
      queryParameters: {
        'momentId': ctx.state.data.id,
        'content': ctx.state.commentEditingController.text,
        if (resourcePath != null) 'pic': resourcePath,
        'replyId': ctx.state.replyInfo?.replyId,
      },
      showLoadingIndicator: true);
  if (result.hasSuccess) {
    KeyboardUtils.unfocus(ctx.context);
    ctx.dispatch(DynamicDetailsActionCreator.onSetReplyInfo(null));
    ctx.dispatch(DynamicDetailsActionCreator.onSetPic(null));
    ctx.dispatch(DynamicDetailsActionCreator.onRefresh(null));
  }
}
