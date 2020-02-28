import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WebviewState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebviewState>>{
      WebviewAction.action: _onAction,
    },
  );
}

WebviewState _onAction(WebviewState state, Action action) {
  final WebviewState newState = state.clone();
  return newState;
}
