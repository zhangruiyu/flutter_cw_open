import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SignInResultDialogState> buildReducer() {
  return asReducer(
    <Object, Reducer<SignInResultDialogState>>{
      SignInResultDialogAction.action: _onAction,
    },
  );
}

SignInResultDialogState _onAction(SignInResultDialogState state, Action action) {
  final SignInResultDialogState newState = state.clone();
  return newState;
}
