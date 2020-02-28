import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommitMediaState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommitMediaState>>{
      CommitMediaAction.ChangeSelectPic: _onChangeSelectPic,
    },
  );
}

CommitMediaState _onChangeSelectPic(CommitMediaState state, Action action) {
  final CommitMediaState newState = state.clone()..picFilePath = action.payload;

  return newState;
}
