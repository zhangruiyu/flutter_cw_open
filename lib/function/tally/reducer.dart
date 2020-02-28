import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TallyState> buildReducer() {
  return asReducer(
    <Object, Reducer<TallyState>>{
      TallyAction.AddPageListData: _onAddPageListData,
    },
  );
}

TallyState _onAddPageListData(TallyState state, Action action) {
  final TallyState newState = state.clone();
  newState.data = action.payload['data'];
  return newState;
}
