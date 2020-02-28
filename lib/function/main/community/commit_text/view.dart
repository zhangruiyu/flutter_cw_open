import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommitTextState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("发布动态"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(CommitTextActionCreator.onUploadCommit());
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
                autofocus: true,
                controller: state.contentTextEditingController,
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: "分享你的故事", border: InputBorder.none),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
