import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommunityUserHeadState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommunityUserHeadState>>{
      CommunityUserHeadAction.action: _onAction,
    },
  );
}

CommunityUserHeadState _onAction(CommunityUserHeadState state, Action action) {
  final CommunityUserHeadState newState = state.clone();
  return newState;
}
