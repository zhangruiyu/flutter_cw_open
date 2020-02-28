import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyAdoptionState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyAdoptionState>>{
      MyAdoptionAction.ResetData: _onResetData,
    },
  );
}

MyAdoptionState _onResetData(MyAdoptionState state, Action action) {
  final MyAdoptionState newState = state.clone()..data = action.payload;
  return newState;
}
