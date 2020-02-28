import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserDetailsEditState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserDetailsEditState>>{
      UserDetailsEditAction.SetLocalAvatar: _onSetLocalAvatar,
    },
  );
}

UserDetailsEditState _onSetLocalAvatar(
    UserDetailsEditState state, Action action) {
  final UserDetailsEditState newState = state.clone()
    ..localAvatar = action.payload;
  return newState;
}
