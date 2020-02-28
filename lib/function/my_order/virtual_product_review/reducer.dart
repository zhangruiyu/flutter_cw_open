import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<VirtualProductReviewState> buildReducer() {
  return asReducer(
    <Object, Reducer<VirtualProductReviewState>>{
      VirtualProductReviewAction.action: _onAction,
    },
  );
}

VirtualProductReviewState _onAction(VirtualProductReviewState state, Action action) {
  final VirtualProductReviewState newState = state.clone();
  return newState;
}
