import 'package:chongmeng/constants/colors.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SelectTalkTypeState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    backgroundColor: colorf2f2f2,
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 88.0, left: 30.0),
              child: Text(
                "晒晒你的宠物",
                style: of.textTheme.title,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildItem(
                    MdiIcons.cameraEnhanceOutline,
                    Colors.red,
                    "拍摄",
                    of,
                    onPressed: () {
                      dispatch(
                          SelectTalkTypeActionCreator.onSkipPage("camera"));
                    },
                  ),
                  buildItem(
                    MdiIcons.imageAlbum,
                    Colors.green[300],
                    "相册",
                    of,
                    onPressed: () {
                      dispatch(SelectTalkTypeActionCreator.onSkipPage("album"));
                    },
                  ),
                  buildItem(
                    MdiIcons.fileDocument,
                    Colors.blue[300],
                    "文章",
                    of,
                    onPressed: () {
                      dispatch(
                          SelectTalkTypeActionCreator.onSkipPage("article"));
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(viewService.context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildItem(IconData icon, Color color, String text, ThemeData of,
    {Null Function() onPressed}) {
  return Column(
    children: <Widget>[
      ClipOval(
        child: Container(
          width: 60.0,
          height: 60.0,
          color: Colors.white,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: color,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 50.0),
        child: Text(
          text,
          style: of.textTheme.subtitle,
        ),
      )
    ],
  );
}
