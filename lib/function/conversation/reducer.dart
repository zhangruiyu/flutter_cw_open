import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ConversationState> buildReducer() {
  return asReducer(
    <Object, Reducer<ConversationState>>{
      ConversationAction.ReSetConversations: _onReSetConversations,
    },
  );
}

ConversationState _onReSetConversations(
    ConversationState state, Action action) {
  final ConversationState newState = state.clone()
    ..conversations = action.payload;
  return newState;
}
