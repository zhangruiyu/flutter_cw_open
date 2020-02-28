import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IntegralItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<IntegralItemState>>{
//      IntegralItemAction.action: _onAction,
    },
  );
}

IntegralItemState _onAction(IntegralItemState state, Action action) {
  final IntegralItemState newState = state.clone();
  return newState;
}
