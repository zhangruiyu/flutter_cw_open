import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReplyState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReplyState>>{
      ReplyAction.action: _onAction,
    },
  );
}

ReplyState _onAction(ReplyState state, Action action) {
  final ReplyState newState = state.clone();
  return newState;
}
