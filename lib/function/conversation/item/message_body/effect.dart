import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<MessageBodyState> buildEffect() {
  return combineEffects(<Object, Effect<MessageBodyState>>{
    MessageBodyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<MessageBodyState> ctx) {
}
