import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IntegralStoreState> buildReducer() {
  return asReducer(
    <Object, Reducer<IntegralStoreState>>{
      IntegralStoreAction.action: _onAction,
    },
  );
}

IntegralStoreState _onAction(IntegralStoreState state, Action action) {
  final IntegralStoreState newState = state.clone();
  return newState;
}
