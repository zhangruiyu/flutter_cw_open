import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ItemDynamicAdapterState> buildEffect() {
  return combineEffects(<Object, Effect<ItemDynamicAdapterState>>{
    ItemDynamicAdapterAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ItemDynamicAdapterState> ctx) {
}
