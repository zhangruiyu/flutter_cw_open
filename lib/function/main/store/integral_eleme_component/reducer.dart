import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IntegralElemeItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<IntegralElemeItemState>>{
      IntegralElemeItemAction.action: _onAction,
    },
  );
}

IntegralElemeItemState _onAction(IntegralElemeItemState state, Action action) {
  final IntegralElemeItemState newState = state.clone();
  return newState;
}
