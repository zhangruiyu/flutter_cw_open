import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AdoptionDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<AdoptionDetailsState>>{
//      AdoptionDetailsAction.action: _onAction,
    },
  );
}

AdoptionDetailsState _onAction(AdoptionDetailsState state, Action action) {
  final AdoptionDetailsState newState = state.clone();
  return newState;
}
