import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<BindTelState> buildReducer() {
  return asReducer(
    <Object, Reducer<BindTelState>>{
      BindTelAction.CheckOK: _onCheckOK,
    },
  );
}

BindTelState _onCheckOK(BindTelState state, Action action) {
  final BindTelState newState = state.clone()..isCheckOK = action.payload;
  return newState;
}
