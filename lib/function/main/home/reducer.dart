import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.SetHomeData: _onSetHomeData,
    },
  );
}

HomeState _onSetHomeData(HomeState state, Action action) {
  final HomeState newState = state.clone()..homeData = action.payload;
  return newState;
}
