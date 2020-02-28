import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ReviewImageState> buildEffect() {
  return combineEffects(<Object, Effect<ReviewImageState>>{
    ReviewImageAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ReviewImageState> ctx) {
}
