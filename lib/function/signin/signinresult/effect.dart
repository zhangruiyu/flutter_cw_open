import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SignInResultDialogState> buildEffect() {
  return combineEffects(<Object, Effect<SignInResultDialogState>>{
    SignInResultDialogAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SignInResultDialogState> ctx) {
}
