import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommitTextState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommitTextState>>{
//      CommitTextAction.action: _onAction,
    },
  );
}

CommitTextState _onAction(CommitTextState state, Action action) {
  final CommitTextState newState = state.clone();
  return newState;
}
