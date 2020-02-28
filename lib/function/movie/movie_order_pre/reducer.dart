import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MovieOrderPreState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieOrderPreState>>{
      MovieOrderPreAction.action: _onAction,
    },
  );
}

MovieOrderPreState _onAction(MovieOrderPreState state, Action action) {
  final MovieOrderPreState newState = state.clone();
  return newState;
}
