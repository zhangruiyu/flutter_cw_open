import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddTallyState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddTallyState>>{
      AddTallyAction.SetChipCheck: _onSetChipCheck,
      AddTallyAction.SetDate: _onSetDate,
      AddTallyAction.SetTallyImage: _onSetTallyImage,
    },
  );
}

AddTallyState _onSetChipCheck(AddTallyState state, Action action) {
  final AddTallyState newState = state.clone();
  if (newState.selectId.contains(action.payload)) {
    newState.selectId.remove(action.payload);
  } else {
    newState.selectId.add(action.payload);
  }
  return newState;
}

AddTallyState _onSetDate(AddTallyState state, Action action) {
  final AddTallyState newState = state.clone();
  newState.takeDate = action.payload;
  return newState;
}

AddTallyState _onSetTallyImage(AddTallyState state, Action action) {
  final AddTallyState newState = state.clone()..image = action.payload;
  return newState;
}
