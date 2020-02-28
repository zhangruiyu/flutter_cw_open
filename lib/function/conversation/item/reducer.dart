import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ConversationItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ConversationItemState>>{
      ConversationItemAction.AddAllMessage: _onAddAllMessage,
      ConversationItemAction.AddSendMessage: _onAddSendMessage,
      ConversationItemAction.SetTextIsEmpty: _onSetTextIsEmpty,
      ConversationItemAction.SetBottomAction: _onSetBottomAction,
    },
  );
}

ConversationItemState _onReSetPage(ConversationItemState state, Action action) {
  final ConversationItemState newState = state.clone();
  return newState;
}

ConversationItemState _onAddSendMessage(
    ConversationItemState state, Action action) {
  final ConversationItemState newState = state.clone();
  newState
    ..messages = (List.from(newState.messages)..insert(0, action.payload))
    ..sendMessages =
        (List.from(newState.sendMessages)..insert(0, action.payload));
  return newState;
}

ConversationItemState _onAddAllMessage(
    ConversationItemState state, Action action) {
  final ConversationItemState newState = state.clone();
  newState
    ..messages = (List.from(newState.messages)
      ..insertAll(newState.messages.length, action.payload));
  newState.localIndex = newState.localIndex + 1;
  return newState;
}

ConversationItemState _onSetTextIsEmpty(
    ConversationItemState state, Action action) {
  final ConversationItemState newState = state.clone()
    ..textIsEmpty = action.payload;
  return newState;
}

ConversationItemState _onSetBottomAction(
    ConversationItemState state, Action action) {
  final ConversationItemState newState = state.clone()
    ..bottomAction = action.payload;
  return newState;
}
