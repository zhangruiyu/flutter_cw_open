import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeListState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeListState>>{
      HomeListAction.action: _onAction,
    },
  );
}

HomeListState _onAction(HomeListState state, Action action) {
  final HomeListState newState = state.clone();
  return newState;
}
