import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ComplainState> buildReducer() {
  return asReducer(
    <Object, Reducer<ComplainState>>{
      ComplainAction.ChangePosition: _onChangePosition,
    },
  );
}

ComplainState _onChangePosition(ComplainState state, Action action) {
  final ComplainState newState = state.clone()..selectPosition = action.payload;
  return newState;
}
