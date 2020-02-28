import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ItemDynamicAdapterState> buildReducer() {
  return asReducer(
    <Object, Reducer<ItemDynamicAdapterState>>{
      ItemDynamicAdapterAction.action: _onAction,
    },
  );
}

ItemDynamicAdapterState _onAction(ItemDynamicAdapterState state, Action action) {
  final ItemDynamicAdapterState newState = state.clone();
  return newState;
}
