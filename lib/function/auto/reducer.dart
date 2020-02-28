import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AutoState> buildReducer() {
  return asReducer(
    <Object, Reducer<AutoState>>{
      AutoAction.CheckOK: _onCheckOK,
    },
  );
}

AutoState _onCheckOK(AutoState state, Action action) {
  final AutoState newState = state.clone()..isCheckOK = action.payload;
  return newState;
}
