import 'dart:io';

import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';
import 'package:thumbnails/thumbnails.dart';
import 'package:path_provider/path_provider.dart';
import 'action.dart';
import 'state.dart';
import 'package:camera/camera.dart';

Effect<RecordState> buildEffect() {
  return combineEffects(<Object, Effect<RecordState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    RecordAction.CameraSwitched: _onCameraSwitched,
    RecordAction.TakePicture: _onTakePicture,
    RecordAction.RecordStart: _onRecordStart,
    RecordAction.RecordEnd: _onRecordEnd,
  });
}

void _dispose(Action action, Context<RecordState> ctx) {
  ctx.state?.controller?.dispose();
}

//不能写异步代码不然导致初始化问题
void _initState(Action action, Context<RecordState> ctx) {
  ctx.state.controller =
      CameraController(ctx.state.cameras[0], ResolutionPreset.high);
//  ctx.state.controller.description  = ctx.state.cameras[0];
  ctx.state.controller.initialize().then((_) {
    if (ctx.isDisposed) {
      return;
    }
    ctx.dispatch(RecordActionCreator.onRefreshPage());
  });
}

void _onCameraSwitched(Action action, Context<RecordState> ctx) async {
  CameraDescription cameraDescription;
  if (ctx.state.controller.description == ctx.state.cameras[0]) {
    cameraDescription = ctx.state.cameras[1];
  } else {
    cameraDescription = ctx.state.cameras[0];
  }

  if (ctx.state.controller != null) {
    await ctx.state.controller.dispose();
  }

  ctx.state.controller =
      CameraController(cameraDescription, ResolutionPreset.high);

  // If the controller is updated then update the UI.
  ctx.state.controller.addListener(() {
    if (!ctx.isDisposed) {
      ctx.dispatch(RecordActionCreator.onRefreshPage());
    }

    if (ctx.state.controller.value.hasError) {
      showToast('Camera error ${ctx.state.controller.value.errorDescription}');
    }
  });

  try {
    await ctx.state.controller.initialize();
  } on CameraException catch (e) {
    showToast('Camera error $e');
  }

  if (!ctx.isDisposed) {
    ctx.dispatch(RecordActionCreator.onRefreshPage());
  }
}

void _onTakePicture(Action action, Context<RecordState> ctx) async {
  if (!ctx.state.controller.value.isInitialized) {
    showToast('Please wait');

    return null;
  }

  // Do nothing if a capture is on progress
  if (ctx.state.controller.value.isTakingPicture) {
    return null;
  }

  final Directory appDirectory = await getApplicationDocumentsDirectory();
  final String pictureDirectory = '${appDirectory.path}/Pictures';
  await Directory(pictureDirectory).create(recursive: true);
  final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
  //存储图片路径
  final String filePath = '$pictureDirectory/$currentTime.jpg';

  try {
    await ctx.state.controller.takePicture(filePath);
    showToast("拍照成功");
    Navigator.popAndPushNamed(ctx.context, PageConstants.ReviewIVPage,
        arguments: {'filePath': filePath, 'type': 'image'});
    println(filePath);
  } on CameraException catch (e) {
    showToast(e.toString());
    return null;
  }
}

void _onRecordStart(Action action, Context<RecordState> ctx) async {
  if (!ctx.state.controller.value.isInitialized) {
    showToast('Please wait');
    return null;
  }

  // Do nothing if a capture is on progress
  if (ctx.state.controller.value.isRecordingVideo ||
      ctx.state.controller.value.isStreamingImages) {
    return null;
  }
  final Directory appDirectory = await getApplicationDocumentsDirectory();
  final String pictureDirectory = '${appDirectory.path}/Videos';
  await Directory(pictureDirectory).create(recursive: true);
  final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
  //存储视频路径
  ctx.state.videoPath = '$pictureDirectory/$currentTime.mp4';
  try {
    if (await File(ctx.state.videoPath).exists()) {
      await File(ctx.state.videoPath).delete();
    }
    await ctx.state.controller.startVideoRecording(ctx.state.videoPath);
  } on CameraException catch (e) {
    showToast(e.toString());
  }
}

void _onRecordEnd(Action action, Context<RecordState> ctx) async {
  if (ctx.state.controller.value.isInitialized &&
      ctx.state.controller.value.isRecordingVideo) {
    try {
      await ctx.state.controller.stopVideoRecording();
      String thumb = await Thumbnails.getThumbnail(
          thumbnailFolder: (await getApplicationDocumentsDirectory()).path +
              "/thumb", // creates the specified path if it doesnt exist
          videoFile: ctx.state.videoPath,
          imageType: ThumbFormat.PNG,
          quality: 50);

      Navigator.popAndPushNamed(ctx.context, PageConstants.ReviewIVPage,
          arguments: {
            'filePath': ctx.state.videoPath,
            'type': 'video',
            'videoThumbnail': thumb
          });
    } on CameraException catch (e) {
      showToast(e.toString());
      return null;
    }
  }
}
