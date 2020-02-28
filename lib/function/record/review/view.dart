import 'dart:io';

import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ReviewIVState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      actions: state.canSkip
          ? <Widget>[
              IconButton(
                onPressed: () {
                  dispatch(ReviewIVActionCreator.onSkipCommitPage());
                },
                icon: Icon(
                  MdiIcons.send,
                  color: Colors.black,
                ),
              ),
            ]
          : null,
    ),
    body: state.type == "image"
        ? Image.file(
            File(state.filePath),
            width: double.infinity,
            height: double.infinity,
          )
        : Container(
            // height: 400, // 这里随意
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: IjkPlayer(
                mediaController: state.videoController,
              ),
            ),
          ),
  );
}
