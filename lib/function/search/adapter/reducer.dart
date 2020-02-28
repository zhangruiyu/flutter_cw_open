import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'action.dart';

Reducer<SearchState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchState>>{
      SearchListAction.action: _onAction,
    },
  );
}

SearchState _onAction(SearchState state, Action action) {
  final SearchState newState = state.clone();
  return newState;
}
