import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecordState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecordState>>{
      RecordAction.RefreshPage: _onRefreshPage,
    },
  );
}

RecordState _onRefreshPage(RecordState state, Action action) {
  final RecordState newState = state.clone();
  return newState;
}
