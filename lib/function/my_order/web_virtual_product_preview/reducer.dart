import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WebVirtualProductPreviewState> buildReducer() {
  return asReducer(
    <Object, Reducer<WebVirtualProductPreviewState>>{
      WebVirtualProductPreviewAction.action: _onAction,
    },
  );
}

WebVirtualProductPreviewState _onAction(WebVirtualProductPreviewState state, Action action) {
  final WebVirtualProductPreviewState newState = state.clone();
  return newState;
}
