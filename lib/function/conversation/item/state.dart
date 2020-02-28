import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

class ConversationItemState implements Cloneable<ConversationItemState> {
  GlobalKey<SliverAnimatedListState> listKey =
      new GlobalKey<SliverAnimatedListState>();
  TextEditingController messagesTextEditingController;
  JMMessageEventListener messageEventListener;
  List<JMNormalMessage> messages;
  EasyRefreshController easyRefreshController;

  //自己发送的messgae
  List<JMNormalMessage> sendMessages;
  JMConversationInfo conversationInfo;
  bool textIsEmpty;

  //底部展示
  String bottomAction;

  //本地消息行数
  int localIndex;

  @override
  ConversationItemState clone() {
    return ConversationItemState()
      ..bottomAction = bottomAction
      ..textIsEmpty = textIsEmpty
      ..sendMessages = sendMessages
      ..localIndex = localIndex
      ..easyRefreshController = easyRefreshController
      ..messagesTextEditingController = messagesTextEditingController
      ..messages = messages
      ..listKey = listKey
      ..conversationInfo = conversationInfo
      ..messageEventListener = messageEventListener;
  }

  static final action = "action";
  static final emoji = "emoji";
  static final normal = "normal";
}

ConversationItemState initState(Map<String, dynamic> args) {
  return ConversationItemState()
    ..bottomAction = ConversationItemState.normal
    ..textIsEmpty = true
    ..localIndex = 1
    ..sendMessages = []
    ..messagesTextEditingController = TextEditingController()
    ..easyRefreshController = EasyRefreshController()
    ..conversationInfo = args['conversationInfo']
    ..messages = args['messages'];
}
