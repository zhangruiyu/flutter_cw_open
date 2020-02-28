import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<VirtualProductReviewState> buildEffect() {
  return combineEffects(<Object, Effect<VirtualProductReviewState>>{
    VirtualProductReviewAction.action: _onAction,
  });
}

void _onAction(Action action, Context<VirtualProductReviewState> ctx) {
}
