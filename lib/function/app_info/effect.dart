import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AppInfoState> buildEffect() {
  return combineEffects(<Object, Effect<AppInfoState>>{
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<AppInfoState> ctx) {}
