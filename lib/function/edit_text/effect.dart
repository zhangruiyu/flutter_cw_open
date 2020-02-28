import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<EditTextState> buildEffect() {
  return combineEffects(<Object, Effect<EditTextState>>{
    EditTextAction.action: _onAction,
  });
}

void _onAction(Action action, Context<EditTextState> ctx) {
}
