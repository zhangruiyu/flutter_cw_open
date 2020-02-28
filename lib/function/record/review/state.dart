import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class ReviewIVState implements Cloneable<ReviewIVState> {
  String filePath;
  String type;
  String videoThumbnail;
  IjkMediaController videoController;

  //是否能跳转到提交页面
  bool canSkip;

  @override
  ReviewIVState clone() {
    return ReviewIVState()
      ..filePath = filePath
      ..type = type
      ..videoThumbnail = videoThumbnail
      ..videoController = videoController;
  }
}

ReviewIVState initState(Map<String, dynamic> args) {
  var reviewIVState = ReviewIVState()
    ..filePath = args['filePath']
    ..type = args['type'];
  if (reviewIVState.type == "video") {
    reviewIVState.videoController = IjkMediaController();
    reviewIVState.videoThumbnail = args['videoThumbnail'];
  }
  if (args['canSkip'] == null) {
    //可能为空
    reviewIVState.canSkip = true;
  } else {
    reviewIVState.canSkip = false;
  }
  return reviewIVState;
}
