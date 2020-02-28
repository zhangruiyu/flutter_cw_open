import 'dart:io';

import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/utils/keyboard_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';
import 'action.dart';
import 'state.dart';

Widget buildView(
    ConversationItemState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    backgroundColor: colorWhite,
    appBar: Toolbar(
      title: Text(
        state.conversationInfo.target.nickname,
        style: TextStyle(color: colorWhite),
      ),
    ),
    body: Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: colorf3f3f3,
            child: EasyRefresh.custom(
              controller: state.easyRefreshController,
              reverse: true,
              onLoad: () async {
                await CompleterUtils.produceCompleterAction(
                    dispatch, ConversationItemActionCreator.onRefresh)();
              },
              slivers: <Widget>[
                SliverAnimatedList(
                  key: state.listKey,
                  itemBuilder:
                      (BuildContext context, int index, Animation animation) {
                    var message = state.messages[index];
                    println(
                        "message.from.avatarThumbPath 4{${message.from.avatarThumbPath}");
                    List<Widget> widgets = [];
                    widgets.addAll([
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                        child: CircleAvatar(
                          backgroundImage:
                              FileImage(File(message.from.avatarThumbPath)),
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
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
                            maxWidth:
                                max(100.0, WindowUtils.getScreenWidth() * 0.3),
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
                                  dispatch(
                                      ConversationItemActionCreator.onReviewPic(
                                          message));
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

                    return SizeTransition(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: message.isSend
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: message.isSend
                              ? widgets.reversed.toList()
                              : widgets,
                        ),
                      ),
                      sizeFactor: animation,
                    );
                  },
//                  reverse: true,
                  initialItemCount: state.messages?.length ?? 0,
                )
              ],
            ),
          ),
        ),
        buildBottom(state, dispatch, viewService),
        VerticalLine(
          height: 1.0,
        ),
        AnimatedContainer(
          height: state.bottomAction != ConversationItemState.normal
              ? state.bottomAction == ConversationItemState.action
                  ? 60.0
                  : 211.0
              : 0.0,
          child: buildBottomAction(state, dispatch, viewService),
          duration: Duration(milliseconds: 300),
        )
      ],
    ),
  );
}

Widget buildBottomAction(
    ConversationItemState state, Dispatch dispatch, ViewService viewService) {
  return state.bottomAction == ConversationItemState.emoji
      ? EmojiPicker(
          bgColor: colorWhite,
          rows: 3,
          columns: 7,
          recommendKeywords: [
            'Grinning Face',
            'Grinning Face With Big Eyes',
            'Grinning Face With Smiling Eyes',
            'Beaming Face With Smiling Eyes',
          ],
          numRecommended: 10,
          onEmojiSelected: (emoji, category) {
            KeyboardUtils.insertText(
                state.messagesTextEditingController, emoji.emoji);
          },
        )
      : state.bottomAction == ConversationItemState.normal
          ? null
          : Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("拍照"),
                  onPressed: () {
                    dispatch(ConversationItemActionCreator.onSendImageMessage(
                        "camera"));
                  },
                ),
                RaisedButton(
                  child: Text("相册选择"),
                  onPressed: () {
                    dispatch(ConversationItemActionCreator.onSendImageMessage(
                        "gallery"));
                  },
                ),
              ],
            );
}

Widget buildBottom(
    ConversationItemState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: state.messagesTextEditingController,
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 13.0, bottom: 13.0),
              hintText: "想跟TA说点什么呢",
            ),
          ),
        ),
        IconButton(
          hoverColor: colorWhite,
          icon: Icon(MdiIcons.stickerEmoji),
          onPressed: () {
            KeyboardUtils.hide();
            dispatch(ConversationItemActionCreator.onSetBottomAction(
                state.bottomAction == ConversationItemState.emoji
                    ? ConversationItemState.normal
                    : ConversationItemState.emoji));
          },
        ),
        AnimatedSwitcher(
          transitionBuilder: (child, anim) {
            return ScaleTransition(child: child, scale: anim);
          },
          duration: Duration(milliseconds: 300),
          child: new IconButton(
              key: ValueKey(state.textIsEmpty),
              padding: const EdgeInsets.all(0.0),
              icon: state.textIsEmpty
                  ? Icon(Icons.add)
                  : Icon(
                      Icons.send,
                      color: Theme.of(viewService.context).accentColor,
                    ),
              onPressed: () {
                dispatch(ConversationItemActionCreator.onActionButton());
              }),
        )
      ],
    ),
  );
}
