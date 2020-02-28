import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ReplyListState> buildReducer() {
  return asReducer(
    <Object, Reducer<ReplyListState>>{
      ReplyListAction.action: _onAction,
    },
  );
}

ReplyListState _onAction(ReplyListState state, Action action) {
  final ReplyListState newState = state.clone();
  return newState;
}
