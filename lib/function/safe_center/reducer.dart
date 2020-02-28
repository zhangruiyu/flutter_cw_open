import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SafeCenterState> buildReducer() {
  return asReducer(
    <Object, Reducer<SafeCenterState>>{
      SafeCenterAction.ResetData: _onResetData,
    },
  );
}

SafeCenterState _onResetData(SafeCenterState state, Action action) {
  final SafeCenterState newState = state.clone()..data = action.payload;
  return newState;
}
