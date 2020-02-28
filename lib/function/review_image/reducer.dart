import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReviewImageState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReviewImageState>>{
      ReviewImageAction.action: _onAction,
    },
  );
}

ReviewImageState _onAction(ReviewImageState state, Action action) {
  final ReviewImageState newState = state.clone();
  return newState;
}
