import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<InviteState> buildReducer() {
  return asReducer(
    <Object, Reducer<InviteState>>{
      InviteAction.ReSetData: _onReSetData,
    },
  );
}

InviteState _onReSetData(InviteState state, Action action) {
  final InviteState newState = state.clone()..data = action.payload;
  return newState;
}
