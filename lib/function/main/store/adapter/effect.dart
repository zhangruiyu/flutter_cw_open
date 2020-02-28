import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<IntegralStoreState> buildEffect() {
  return combineEffects(<Object, Effect<IntegralStoreState>>{
    IntegralStoreAction.action: _onAction,
  });
}

void _onAction(Action action, Context<IntegralStoreState> ctx) {
}
