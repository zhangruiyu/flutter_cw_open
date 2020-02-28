import 'dart:io';

import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommitMediaState state, Dispatch dispatch, ViewService viewService) {
  //是否是视频
  bool isVideo = state.type == "video";

  return Scaffold(
    appBar: Toolbar(
      title: Text("发布动态"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              if (isVideo) {
                dispatch(CommitMediaActionCreator.onUploadCommitVideo());
              } else {
                dispatch(CommitMediaActionCreator.onUploadCommitPic());
              }
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("发布"),
            ),
          ),
        )
      ],
    ),
    body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                controller: state.contentTextEditingController,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: "分享你的故事", border: InputBorder.none),
              ),
            ),
            isVideo
                ? buildVideoView(state, dispatch, viewService)
                : buildPicsView(state, dispatch, viewService)
          ],
        ),
      ],
    ),
  );
}

Widget buildVideoView(
    CommitMediaState state, Dispatch dispatch, ViewService viewService) {
  double itemWidth = WindowUtils.getScreenWidth() / 3.toDouble();
  return Container(
    alignment: Alignment.topLeft,
    margin: EdgeInsets.only(left: 20.0),
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.file(
          File(state.videoThumbnail.localUrl),
          width: itemWidth,
        ),
        IconButton(
          onPressed: () {
            dispatch(CommitMediaActionCreator.onSkipReviewPage());
          },
          icon: Icon(Icons.play_circle_outline),
          color: Theme.of(viewService.context).accentColor,
          iconSize: 50.0,
        )
      ],
    ),
  );
}

Widget buildPicsView(
    CommitMediaState state, Dispatch dispatch, ViewService viewService) {
  int gridCount = 3;
  List<Widget> gridItems = new List<Widget>();

  double itemWidth = WindowUtils.getScreenWidth() / 5.toDouble();
  List<UploadTask> selectedPics = state.picFilePath;
  selectedPics.forEach((UploadTask selectedPic) {
    selectedPic.sequence = selectedPics.indexOf(selectedPic);
    Widget item = new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Image.file(
        new File(selectedPic.localUrl.toString()),
        fit: BoxFit.cover,
        width: itemWidth,
        height: itemWidth,
      ),
    );
    gridItems.add(item);
  });
  if (state.picFilePath.length < 9) {
    gridItems.add(new IconButton(
        icon: new Icon(
          Icons.add_a_photo,
          size: 30.0,
          color: const Color(0x40808080),
        ),
        onPressed: () {
          dispatch(CommitMediaActionCreator.onReselectPic());
        }));
  }
  return Container(
    height: MediaQuery.of(viewService.context).size.width /
        gridCount *
        ((gridItems.length) / gridCount).ceil(),
    child: GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridCount),
      children: gridItems,
    ),
  );
}
