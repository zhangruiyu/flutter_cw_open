import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/widget/custom_dialog.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'action.dart';
import 'state.dart';

const updateChannelName = 'plugins.iwubida.com/update_version';
const updateStream = const EventChannel(updateChannelName);

Widget buildView(
    UpdateState state, Dispatch dispatch, ViewService viewService) {
  var data = state.data;
  var hintTextList = data.info.map((itemHint) {
    var itemMarginTop = data.info.indexOf(itemHint) == 0 ? 15.0 : 26.0;
    return SizedBox(
      width: 275,
      child: Padding(
        padding: new EdgeInsets.only(top: itemMarginTop, left: 16.0),
        child: Text(itemHint),
      ),
    );
  }).toList();
  var widgets = <Widget>[];
  widgets
    ..add(Image.asset(
      'assets/update_page_bg.png',
      fit: BoxFit.fitWidth,
    ))
    ..addAll(hintTextList)
    ..add(Container(
      width: 220.0,
      height: 45.0,
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: RaisedButton(
        onPressed: () {
          dispatch(UpdateActionCreator.onStartDown());
        },
        child: Text(
          _getButtonText(state.percent),
          style: TextStyle(color: colorWhite),
        ),
        color: colorAccent,
      ),
    ));
  if (!data.isForceUpdate) {
    widgets.add(GestureDetector(
      child: Image.asset(
        'assets/update_page_cancle.png',
      ),
      onTap: () {
        Navigator.pop(viewService.context);
      },
    ));
  }
  return WillPopScope(
    child: CanSetWidthDialog(
        minWidth: 275.0,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
          child: Container(
            padding: const EdgeInsets.only(bottom: 22.0),
            color: colorWhite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            ),
          ),
        )),
    onWillPop: () {
      return new Future<bool>.value(!data.isForceUpdate);
    },
  );
}

_getButtonText(int percent) {
  if (percent >= 99) {
    return "正在更新";
  }
  if (percent > 0) {
    return "更新中$percent%";
  }
  return "立即更新";
}
