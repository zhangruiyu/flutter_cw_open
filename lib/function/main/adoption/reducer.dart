import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AdoptionState> buildReducer() {
  return asReducer(
    <Object, Reducer<AdoptionState>>{
      AdoptionAction.ResetData: _onResetData,
    },
  );
}

AdoptionState _onResetData(AdoptionState state, Action action) {
  final AdoptionState newState = state.clone()..data = action.payload;
  return newState;
}
