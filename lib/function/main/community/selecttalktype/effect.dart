import 'dart:io';

import 'package:chongmeng/routes.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<SelectTalkTypeState> buildEffect() {
  return combineEffects(<Object, Effect<SelectTalkTypeState>>{
    SelectTalkTypeAction.SkipPage: _onSkipPage,
  });
}

Future _onSkipPage(Action action, Context<SelectTalkTypeState> ctx) async {
  String type = action.payload;
  if (type == "camera") {
    NavigatorHelper.pushRecordPage(ctx.context);
  } else if (type == "album") {
    List<String> imgList =
        await NavigatorHelper.pushFileSelectPageString(ctx.context);
    if ((imgList?.length ?? 0) > 0) {
      Navigator.popAndPushNamed(ctx.context, PageConstants.CommitMediaPage,
          arguments: {'filePath': imgList, 'type': 'image'});
    }
  } else if (type == "article") {
    Navigator.popAndPushNamed(ctx.context, PageConstants.CommitTextPage);
  }
}
