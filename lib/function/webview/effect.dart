import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WebviewState> buildEffect() {
  return combineEffects(<Object, Effect<WebviewState>>{
    WebviewAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WebviewState> ctx) {
}
