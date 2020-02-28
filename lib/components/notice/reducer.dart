import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<NoticeState> buildReducer() {
  return asReducer(
    <Object, Reducer<NoticeState>>{
      NoticeAction.action: _onAction,
    },
  );
}

NoticeState _onAction(NoticeState state, Action action) {
  final NoticeState newState = state.clone();
  return newState;
}
