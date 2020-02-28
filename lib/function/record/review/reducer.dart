import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReviewIVState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReviewIVState>>{
//      ReviewIVAction.action: _onAction,
    },
  );
}

ReviewIVState _onAction(ReviewIVState state, Action action) {
  final ReviewIVState newState = state.clone();
  return newState;
}
