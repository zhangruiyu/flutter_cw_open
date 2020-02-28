import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'action.dart';

Reducer<ConversationItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ConversationItemState>>{
      MessageBodyAction.action: _onAction,
    },
  );
}

ConversationItemState _onAction(ConversationItemState state, Action action) {
  final ConversationItemState newState = state.clone();
  return newState;
}
