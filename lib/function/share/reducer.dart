import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ShareState> buildReducer() {
  return asReducer(
    <Object, Reducer<ShareState>>{
      ShareAction.action: _onAction,
    },
  );
}

ShareState _onAction(ShareState state, Action action) {
  final ShareState newState = state.clone();
  return newState;
}
