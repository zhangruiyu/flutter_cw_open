import 'package:fish_redux/fish_redux.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

enum ConversationAction {
  SkipConversationItemPage,
  ReSetConversations,
  AllRead /*一键已读*/,
}

class ConversationActionCreator {
  static Action onSkipConversationItemPage(JMConversationInfo target) {
    return Action(ConversationAction.SkipConversationItemPage, payload: target);
  }

  static Action onReSetConversations(List<JMConversationInfo> conversations) {
    return Action(ConversationAction.ReSetConversations,
        payload: conversations);
  }

  static Action onAllRead() {
    return Action(
      ConversationAction.AllRead,
    );
  }
}
