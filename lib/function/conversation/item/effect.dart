import 'dart:io';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/conversation/item/page.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/utils/jmessage_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

Effect<ConversationItemState> buildEffect() {
  return combineEffects(<Object, Effect<ConversationItemState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    ConversationItemAction.Refresh: _onRefresh,
    ConversationItemAction.ActionButton: _onActionButton,
    ConversationItemAction.SendImageMessage: _onSendImageMessage,
    ConversationItemAction.ReviewPic: _onReviewPic,
  });
}

void _initState(Action action, Context<ConversationItemState> ctx) {
  ctx.state.messagesTextEditingController.addListener(() {
    var textIsEmpty =
        ctx.state.messagesTextEditingController.text?.isEmpty == true;
    if (ctx.state.textIsEmpty != textIsEmpty) {
      ctx.dispatch(ConversationItemActionCreator.onSetTextIsEmpty(textIsEmpty));
    }
  });

  //message 和 retractedMessage 可能是 JMTextMessage | JMVoiceMessage | JMImageMessage | JMFileMessage | JMEventMessage | JMCustomMessage;
  ctx.state.messageEventListener = (msg) {
    print('listener receive event - message ： ${msg.toJson()}');
    ctx.dispatch(ConversationItemActionCreator.onAddMessage(msg));
    //防止应用被手动杀死导致消息已读 但没返回页面清空未读消息
    resetUnreadMessageCount(ctx);
    ctx.state.listKey.currentState.insertItem(0);
  };
  //进入会话
  jmessage.enterConversation(
      target: ctx.state.conversationInfo.target.targetType);
  jmessage.addReceiveMessageListener(ctx.state.messageEventListener);
}

void _dispose(Action action, Context<ConversationItemState> ctx) {
  //退出会话写在willpop了
  jmessage.exitConversation(
      target: ctx.state.conversationInfo.target.targetType);
  jmessage.removeReceiveMessageListener(ctx.state.messageEventListener);
  resetUnreadMessageCount(ctx);
}

Future _onRefresh(Action action, Context<ConversationItemState> ctx) async {
  println("localIndex ${ctx.state.localIndex}");
  var currentIndex = ctx.state.localIndex;
  List<JMNormalMessage> messages = (await jmessage.getHistoryMessages(
          type: ctx.state.conversationInfo.target.targetType,
          from: currentIndex * ConversationItemPage.LocalMessagePageSize +
              ctx.state.sendMessages.length,
          limit: ConversationItemPage.LocalMessagePageSize,
          isDescend: true))
      .map((item) {
    return item as JMNormalMessage;
  }).toList();

  CompleterUtils.complete(action);
  //防止重复刷新数据
  if (messages.length > 0 && currentIndex == ctx.state.localIndex) {
//    println(
//        "加载更多 ${messages.map((itemMessage) => (itemMessage as JMTextMessage).text).toString()}");
    ctx.dispatch(ConversationItemActionCreator.onAddAllMessage(messages));
    for (int offset = 0; offset < messages.length; offset++) {
      ctx.state.listKey.currentState
          .insertItem(ctx.state.messages.length - messages.length + offset);
    }
  }
  ctx.state.easyRefreshController.finishLoad(
      success: true,
      noMore: messages.length < ConversationItemPage.LocalMessagePageSize);
}

void _onSendImageMessage(
    Action action, Context<ConversationItemState> ctx) async {
  File image;
  if (action.payload == "camera")
    image = await ImagePicker.pickImage(source: ImageSource.camera);
  else
    image = await ImagePicker.pickImage(source: ImageSource.gallery);

  var message = await jmessage.createMessage(
      type: JMMessageType.image,
      targetType: ctx.state.conversationInfo.target.targetType,
      path: image.path,
      extras: {"key1": "value1"});
  sendMessage(message, ctx);
}

Future _onActionButton(
    Action action, Context<ConversationItemState> ctx) async {
  if (ctx.state.textIsEmpty) {
    println(ConversationItemState.action);
    if (ctx.state.bottomAction == ConversationItemState.normal) {
      ctx.dispatch(ConversationItemActionCreator.onSetBottomAction(
          ConversationItemState.action));
    } else if (ctx.state.bottomAction == ConversationItemState.action) {
      ctx.dispatch(ConversationItemActionCreator.onSetBottomAction(
          ConversationItemState.normal));
    } else if (ctx.state.bottomAction == ConversationItemState.emoji) {
      ctx.dispatch(ConversationItemActionCreator.onSetBottomAction(
          ConversationItemState.action));
    }
  } else {
    //发送文字消息
    if (ctx.state.messagesTextEditingController.text?.isEmpty == true) {
      return;
    }
    var message = await jmessage.createMessage(
        type: JMMessageType.text,
        targetType: ctx.state.conversationInfo.target.targetType,
        text: ctx.state.messagesTextEditingController.text,
        extras: {"key1": "value1"});
    sendMessage(message, ctx);
    ctx.state.messagesTextEditingController.clear();
  }
}

Future _onReviewPic(Action action, Context<ConversationItemState> ctx) async {
  JMImageMessage jmImageMessage = action.payload;
  Map<dynamic, dynamic> result = await jmessage.downloadOriginalImage(
    target: jmImageMessage.target.targetType,
    messageId: jmImageMessage.serverMessageId,
  );
  Navigator.pushNamed(ctx.context, PageConstants.ReviewImagePage, arguments: {
    "images": <String>[result['filePath'].toString()],
    "index": 0
  });
}

////设置已读
void resetUnreadMessageCount(Context<ConversationItemState> ctx) {
  JMessageUtils.resetUnreadMessageCount(ctx.state.conversationInfo.target);
}

Future sendMessage(message, Context<ConversationItemState> ctx) async {
  try {
    JMNormalMessage msg = await jmessage.sendMessage(
      message: message,
    );
    //想滑动到底部 但没实现
    println(msg);
//  ctx.state.controller.jumpTo(ctx.state.controller.position.maxScrollExtent);
    ctx.dispatch(ConversationItemActionCreator.onAddSendMessage(msg));
    ctx.state.listKey.currentState.insertItem(0);
  } on PlatformException catch (e) {
    if (e.code == "898002") {
      showToast("该用户未注册聊天功能");
    }
  }
}
