import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'model/cinema_list_entity.dart';
import 'state.dart';

Reducer<CinemaListState> buildReducer() {
  return asReducer(
    <Object, Reducer<CinemaListState>>{
      CinemaListAction.ResetData: _onResetData,
      CinemaListAction.SetLoadMoreData: _onSetLoadMoreData,
    },
  );
}

CinemaListState _onResetData(CinemaListState state, Action action) {
  final CinemaListState newState = state.clone()
    ..data = action.payload
    ..pageIndex = 1;
  return newState;
}

CinemaListState _onSetLoadMoreData(CinemaListState state, Action action) {
  final CinemaListState newState = state.clone();
  newState.data.cinemas.addAll(((action.payload as CinemaListEntity).cinemas));
  return newState;
}
