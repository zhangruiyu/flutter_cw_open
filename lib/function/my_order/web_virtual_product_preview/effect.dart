import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WebVirtualProductPreviewState> buildEffect() {
  return combineEffects(<Object, Effect<WebVirtualProductPreviewState>>{
    WebVirtualProductPreviewAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WebVirtualProductPreviewState> ctx) {
}
