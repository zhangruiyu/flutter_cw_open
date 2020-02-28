import 'dart:convert';
import 'dart:io';

import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/function/main/community/commit_media/state.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path/path.dart' as path;
import 'package:tencent_cos/tencent_cos.dart';

import '../component.dart';
import 'action.dart';
import 'model/upload_task.dart';

Effect<CommitMediaState> buildEffect() {
  return combineEffects(<Object, Effect<CommitMediaState>>{
    CommitMediaAction.ReselectPic: _onReselectPic,
    CommitMediaAction.SkipReviewPage: _onSkipReviewPage,
    CommitMediaAction.UploadCommitPic: _onUploadCommitPic,
    CommitMediaAction.UploadCommitVideo: _onUploadCommitVideo,
    Lifecycle.initState: _initState,
  });
}

Future _onReselectPic(Action action, Context<CommitMediaState> ctx) async {
  List<String> imgList =
      await NavigatorHelper.pushFileSelectPageString(ctx.context);
  if ((imgList?.length ?? 0) > 0) {
    ctx.dispatch(CommitMediaActionCreator.onChangeSelectPic(
        imgList.map((item) => UploadTask(item)).toList()));
  }
}

void _onSkipReviewPage(Action action, Context<CommitMediaState> ctx) {
  Navigator.pushNamed(ctx.context, PageConstants.ReviewIVPage, arguments: {
    'canSkip': false,
    'filePath': ctx.state.videoFilePath.localUrl,
    'type': "video",
    'videoThumbnail': ctx.state.videoThumbnail.localUrl,
  });
}

Future _onUploadCommitPic(Action action, Context<CommitMediaState> ctx) async {
  if (ctx.state.contentTextEditingController.text.length < 5) {
    showToast("不能低于5字");
    return;
  }
  if (ctx.state.contentTextEditingController.text.length > 3000) {
    showToast("不能大于2000字");
    return;
  }
  Result<CosEntity> cosEntity = await RequestClient.request<CosEntity>(
      ctx.context, HttpConstants.PeriodEffectiveSign,
      queryParameters: {'type': CosType.PIC_TYPE});
  if (cosEntity.hasSuccess) {
    CosData data = cosEntity.data.data;
    var tmpSecretId = data.tmpSecretId;
    var tmpSecretKey = data.tmpSecretKey;
    var sessionToken = data.sessionToken;
    var cosPath = data.cosPath;
    var expiredTime = data.expiredTime;

    Future<Null> _handleMessages(MethodCall call) async {
      String localUrl = call.arguments['localUrl'];
      UploadTask containsSelectedPic =
          ctx.state.picFilePath.singleWhere((UploadTask selectedPic) {
        return selectedPic.localUrl == localUrl;
      });
      if (containsSelectedPic == null) {
        print('没找到');
        return;
      }
      //todo  修改进度
      if (call.method == "onProgress") {
        print(call.arguments['progress'].toInt());
//    containsSelectedPic.progressImageKey.currentState
//        .setProgress((call.arguments['progress'] as double).toInt());
      } else if (call.method == "onSuccess") {}
    }

    TencentCos.setMethodCallHandler(_handleMessages);
    NavigatorHelper.showLoadingDialog(ctx.context, true);
    Future.wait(ctx.state.picFilePath.map((itemDynamicSelectedPicTask) {
      return itemDynamicSelectedPicTask.uploadByData(cosEntity.data.data);
    })).then((List onValue) async {
      //图片json串
      String picJson = json.encode(ctx.state.picFilePath.map((UploadTask dspt) {
        return dspt.resourcePath();
      }).toList());
      var result = await commitComment(
          ctx.context,
          CommunityComponent.DynamicTypePic,
          ctx.state.contentTextEditingController.text,
          picJson);
      NavigatorHelper.showLoadingDialog(ctx.context, false);
      if (result.hasSuccess) {
        NavigatorHelper.popToMain(ctx.context);
      }
    }).catchError((onError) {
//      showToast("图片上传失败,发布失败");
      NavigatorHelper.showLoadingDialog(ctx.context, false);
    });
  }
}

Future _onUploadCommitVideo(
    Action action, Context<CommitMediaState> ctx) async {
  if (ctx.state.contentTextEditingController.text.length < 5) {
    showToast("不能低于5字");
    return;
  }
  if (ctx.state.contentTextEditingController.text.length > 3000) {
    showToast("不能大于2000字");
    return;
  }
  Result<CosEntity> cosEntity = await RequestClient.request<CosEntity>(
      ctx.context, HttpConstants.PeriodEffectiveSign,
      queryParameters: {'type': CosType.VIDEO_TYPE});
  if (cosEntity.hasSuccess) {
    CosData data = cosEntity.data.data;
    var tmpSecretId = data.tmpSecretId;
    var tmpSecretKey = data.tmpSecretKey;
    var sessionToken = data.sessionToken;
    var cosPath = data.cosPath;
    var expiredTime = data.expiredTime;
    NavigatorHelper.showLoadingDialog(ctx.context, true);
/*

    //修改地址
    ctx.state.videoThumbnail.resourcePath =
        "$cosPath${path.basename(File(ctx.state.videoThumbnail.localUrl).path)}";
    //修改地址
    ctx.state.videoFilePath.resourcePath =
        "$cosPath${path.basename(File(ctx.state.videoFilePath.localUrl).path)}";
*/

    var videoFutrue = ctx.state.videoFilePath.upload(
        tmpSecretId,
        tmpSecretKey,
        sessionToken,
        expiredTime,
        cosPath,
        data.region,
        data.appid,
        data.bucket);
    var videoThumbnailFutrue = ctx.state.videoThumbnail.upload(
        tmpSecretId,
        tmpSecretKey,
        sessionToken,
        expiredTime,
        cosPath,
        data.region,
        data.appid,
        data.bucket);
    Future.wait([videoFutrue, videoThumbnailFutrue]).then((List onValue) async {
      var result = await commitComment(
          ctx.context,
          CommunityComponent.DynamicTypeVideo,
          ctx.state.contentTextEditingController.text,
          json.encode({
            'videoPath': ctx.state.videoFilePath.resourcePath(),
            'videoThumbnailPath': ctx.state.videoThumbnail.resourcePath()
          }));
      NavigatorHelper.showLoadingDialog(ctx.context, false);
      if (result.hasSuccess) {
        showToast("动态发布成功");
        NavigatorHelper.popToMain(ctx.context);
      }
    }).catchError((onError) {
//      showToast("图片上传失败,发布失败");
      NavigatorHelper.showLoadingDialog(ctx.context, false);
    });
  }
}

Future<Result<OutermostEntity>> commitComment(
    context, int type, String text, String picJson) async {
  //图片上传完毕 开始把信息给服务端
  return RequestClient.request<OutermostEntity>(
      context, HttpConstants.CommitDynamic,
      queryParameters: {
        'type': type,
        'dynamicContent': text,
        'urls': picJson,
      });
}

void _initState(Action action, Context<CommitMediaState> ctx) {}
