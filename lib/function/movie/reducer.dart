import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MovieState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieState>>{
      MovieAction.SetDistrictText: _onSetDistrictText,
      MovieAction.ChangeNewPage: _onChangeNewPage,
    },
  );
}

MovieState _onSetDistrictText(MovieState state, Action action) {
  final MovieState newState = state.clone()..districtText = action.payload;
  return newState;
}

MovieState _onChangeNewPage(MovieState state, Action action) {
  final MovieState newState = state.clone()..pageIndex = action.payload;
  return newState;
}
