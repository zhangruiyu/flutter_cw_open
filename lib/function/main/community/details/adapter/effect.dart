import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ReplyListState> buildEffect() {
  return combineEffects(<Object, Effect<ReplyListState>>{
    ReplyListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ReplyListState> ctx) {
}
