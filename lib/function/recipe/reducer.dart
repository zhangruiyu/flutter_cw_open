import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<RecipeState> buildReducer() {
  return asReducer(
    <Object, Reducer<RecipeState>>{
      RecipeAction.ResetData: _onResetData,
    },
  );
}

RecipeState _onResetData(RecipeState state, Action action) {
  final RecipeState newState = state.clone();
  newState.data = action.payload;
  return newState;
}
