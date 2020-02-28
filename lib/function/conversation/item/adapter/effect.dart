import 'package:fish_redux/fish_redux.dart';
import '../state.dart';
import 'action.dart';

Effect<ConversationItemState> buildEffect() {
  return combineEffects(<Object, Effect<ConversationItemState>>{
    MessageBodyAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ConversationItemState> ctx) {}
