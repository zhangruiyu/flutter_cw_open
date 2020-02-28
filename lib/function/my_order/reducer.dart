import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MyOrderState> buildReducer() {
  return asReducer(
    <Object, Reducer<MyOrderState>>{
      MyOrderAction.ResetPageData: _onResetPageData,
    },
  );
}

MyOrderState _onResetPageData(MyOrderState state, Action action) {
  final MyOrderState newState = state.clone()..data = action.payload;
  return newState;
}
