import 'dart:io';

import 'package:dragablegridview_flutter/dragablegridview_flutter.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'model/upload_task.dart';

class CommitMediaState implements Cloneable<CommitMediaState> {
  UploadTask videoFilePath;
  UploadTask videoThumbnail;
  List<UploadTask> picFilePath;
  EditSwitchController editSwitchController;
  TextEditingController contentTextEditingController;
  String type;

  @override
  CommitMediaState clone() {
    return CommitMediaState()
      ..videoFilePath = videoFilePath
      ..videoThumbnail = videoThumbnail
      ..picFilePath = picFilePath
      ..editSwitchController = editSwitchController
      ..contentTextEditingController = contentTextEditingController
      ..type = type;
  }
}

CommitMediaState initState(Map<String, dynamic> args) {
  var reviewIVState = CommitMediaState()
    ..type = args['type']
    ..editSwitchController = EditSwitchController()
    ..contentTextEditingController = TextEditingController();
  if (reviewIVState.type == "video") {
    reviewIVState
      ..videoFilePath = UploadTask(args['filePath'])
      ..videoThumbnail = UploadTask(args['videoThumbnail']);
  } else {
    if (args['filePath'] is String) {
      reviewIVState..picFilePath = [UploadTask(args['filePath'])];
    } else {
      reviewIVState.picFilePath =
          (args['filePath'] as List<String>).map((item) {
        return UploadTask(item);
      }).toList();
    }
  }
  return reviewIVState;
}
