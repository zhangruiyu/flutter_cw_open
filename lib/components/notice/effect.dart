import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<NoticeState> buildEffect() {
  return combineEffects(<Object, Effect<NoticeState>>{
    NoticeAction.action: _onAction,
  });
}

void _onAction(Action action, Context<NoticeState> ctx) {
}
