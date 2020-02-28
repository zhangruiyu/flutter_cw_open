import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'action.dart';

Effect<SearchState> buildEffect() {
  return combineEffects(<Object, Effect<SearchState>>{
    SearchListAction.action: _onAction,
  });
}

void _onAction(Action action, Context<SearchState> ctx) {}
