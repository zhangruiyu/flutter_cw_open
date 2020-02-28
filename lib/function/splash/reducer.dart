import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SplashState> buildReducer() {
  return asReducer(
    <Object, Reducer<SplashState>>{
      SplashAction.ChangeTimeValue: _onChangeTimeValue,
    },
  );
}

SplashState _onChangeTimeValue(SplashState state, Action action) {
  final SplashState newState = state.clone()..n = (action.payload as int);
  return newState;
}
