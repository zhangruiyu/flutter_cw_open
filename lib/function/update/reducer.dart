import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UpdateState> buildReducer() {
  return asReducer(
    <Object, Reducer<UpdateState>>{
      UpdateAction.UpdateProgress: _onUpdateProgress,
    },
  );
}

UpdateState _onUpdateProgress(UpdateState state, Action action) {
  final UpdateState newState = state.clone()..percent = action.payload;
  return newState;
}
