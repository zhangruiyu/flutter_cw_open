import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AppInfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<AppInfoState>>{
      AppInfoAction.action: _onAction,
    },
  );
}

AppInfoState _onAction(AppInfoState state, Action action) {
  final AppInfoState newState = state.clone();
  return newState;
}
