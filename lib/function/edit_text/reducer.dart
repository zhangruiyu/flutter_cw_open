import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<EditTextState> buildReducer() {
  return asReducer(
    <Object, Reducer<EditTextState>>{
      EditTextAction.action: _onAction,
    },
  );
}

EditTextState _onAction(EditTextState state, Action action) {
  final EditTextState newState = state.clone();
  return newState;
}
