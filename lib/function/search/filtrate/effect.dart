import 'package:fish_redux/fish_redux.dart';
import '../action.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchFiltrateState> buildEffect() {
  return combineEffects(<Object, Effect<SearchFiltrateState>>{
    SearchFiltrateAction.SetTypeAndSearch: _onSetTypeAndSearch,
  });
}

void _onSetTypeAndSearch(Action action, Context<SearchFiltrateState> ctx) {
  ctx.dispatch(SearchFiltrateActionCreator.onSetType(action.payload));
  ctx.dispatch(SearchActionCreator.onSearch());
}
