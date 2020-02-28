import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PayResultState> buildReducer() {
  return asReducer(
    <Object, Reducer<PayResultState>>{
      PayResultAction.action: _onAction,
    },
  );
}

PayResultState _onAction(PayResultState state, Action action) {
  final PayResultState newState = state.clone();
  return newState;
}
