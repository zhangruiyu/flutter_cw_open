import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WebVirtualProductPreviewState state, Dispatch dispatch,
    ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    appBar: Toolbar(
      title: Text(state.data.first.name),
    ),
    body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      ...state.data.map((itemTick) => Container(
            width: WindowUtils.getScreenWidth() - 38 * 2,
            height: 45.0,
            margin: const EdgeInsets.only(top: 92.0, left: 38, right: 38),
            child: RaisedButton(
              elevation: 0.0,
              color: of.accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: Text("电子券${state.data.indexOf(itemTick) + 1}号链接"),
              textColor: colorWhite,
              onPressed: () {
                NavigatorHelper.pushWebPage(viewService.context,
                    state.data.first.name, itemTick.content);
              },
            ),
          )),
      SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(state.data.first.remake),
        ),
      )
    ]),
  );
}
