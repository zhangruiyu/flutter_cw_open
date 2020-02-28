import 'package:fish_redux/fish_redux.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

class ConversationState implements Cloneable<ConversationState> {
  List<JMConversationInfo> conversations;

  JMMessageEventListener messageEventListener;

  @override
  ConversationState clone() {
    return ConversationState()
      ..conversations = conversations
      ..messageEventListener = messageEventListener;
  }
}

ConversationState initState(Map<String, dynamic> args) {
  return ConversationState();
}
