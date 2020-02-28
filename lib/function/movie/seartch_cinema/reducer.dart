import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchCinemaState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchCinemaState>>{
      SearchCinemaAction.action: _onAction,
    },
  );
}

SearchCinemaState _onAction(SearchCinemaState state, Action action) {
  final SearchCinemaState newState = state.clone();
  return newState;
}
