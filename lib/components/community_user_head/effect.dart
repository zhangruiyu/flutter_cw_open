import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CommunityUserHeadState> buildEffect() {
  return combineEffects(<Object, Effect<CommunityUserHeadState>>{
    CommunityUserHeadAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CommunityUserHeadState> ctx) {
}
