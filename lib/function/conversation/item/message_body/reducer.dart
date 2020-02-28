import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MessageBodyState> buildReducer() {
  return asReducer(
    <Object, Reducer<MessageBodyState>>{
      MessageBodyAction.action: _onAction,
    },
  );
}

MessageBodyState _onAction(MessageBodyState state, Action action) {
  final MessageBodyState newState = state.clone();
  return newState;
}
