import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchFiltrateState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchFiltrateState>>{
      SearchFiltrateAction.SetType: _onSetType,
    },
  );
}

SearchFiltrateState _onSetType(SearchFiltrateState state, Action action) {
  final SearchFiltrateState newState = state.clone()..type = action.payload;
  return newState;
}
