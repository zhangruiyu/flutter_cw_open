import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyPetState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyPetState>>{
      MyPetAction.ResetData: _onResetData,
    },
  );
}

MyPetState _onResetData(MyPetState state, Action action) {
  final MyPetState newState = state.clone()..data = action.payload;
  return newState;
}
