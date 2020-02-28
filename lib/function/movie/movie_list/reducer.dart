import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MovieListState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieListState>>{
      MovieListAction.ResetData: _onResetData,
    },
  );
}

MovieListState _onResetData(MovieListState state, Action action) {
  final MovieListState newState = state.clone()..data = action.payload;
  return newState;
}
