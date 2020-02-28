import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchCinemaState> buildEffect() {
  return combineEffects(<Object, Effect<SearchCinemaState>>{
    SearchCinemaAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SearchCinemaState> ctx) {
}
