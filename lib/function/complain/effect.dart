import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ComplainState> buildEffect() {
  return combineEffects(<Object, Effect<ComplainState>>{
    ComplainAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ComplainState> ctx) {
}
