import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeListState> buildEffect() {
  return combineEffects(<Object, Effect<HomeListState>>{
    HomeListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<HomeListState> ctx) {
}
