import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<PayResultState> buildEffect() {
  return combineEffects(<Object, Effect<PayResultState>>{
    PayResultAction.action: _onAction,
  });
}

void _onAction(Action action, Context<PayResultState> ctx) {
}
