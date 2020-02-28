import 'dart:io';
import 'dart:math';

import 'package:chongmeng/function/conversation/item/action.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MessageBodyState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var message = state.itemMessage;
  println("message.from.avatarThumbPath 4{${message.from.avatarThumbPath}");
  List<Widget> widgets = [];
  widgets.addAll([
    Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: CircleAvatar(
        backgroundImage: FileImage(File(message.from.avatarThumbPath)),
      ),
    ),
  ]);
  if (message is JMTextMessage) {
    widgets.add(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (!message.isSend)
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              message.from.nickname,
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        LimitedBox(
          maxWidth: WindowUtils.getScreenWidth() * 0.6,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: of.accentColor,
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            child: Text(
              message.text,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    ));
  } else if (message is JMImageMessage) {
    widgets.add(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (!message.isSend)
          Container(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              message.from.nickname,
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        LimitedBox(
          maxWidth: max(100.0, WindowUtils.getScreenWidth() * 0.3),
          child: Container(
            /*padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5.0),*/
            decoration: BoxDecoration(
              color: of.accentColor,
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                dispatch(ConversationItemActionCreator.onReviewPic(message));
              },
              child: Image.asset(
                message.thumbPath,
              ),
            ),
          ),
        ),
      ],
    ));
  }
  //todo 此处缺少SizeTransition
  return Padding(
    padding:
        const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          message.isSend ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: message.isSend ? widgets.reversed.toList() : widgets,
    ),
  );
}
