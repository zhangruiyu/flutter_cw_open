import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.ChangeNewPage: _onChangeNewPage,
    },
  );
}

MainState _onChangeNewPage(MainState state, Action action) {
  final MainState newState = state.clone()..mainPageIndex = action.payload;
  return newState;
}
