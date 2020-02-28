import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DynamicDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<DynamicDetailsState>>{
      DynamicDetailsAction.SetPic: _onSetPic,
      DynamicDetailsAction.ResetData: _onResetData,
      DynamicDetailsAction.SetReplyInfo: _onSetReplyInfo,
    },
  );
}

DynamicDetailsState _onSetPic(DynamicDetailsState state, Action action) {
  final DynamicDetailsState newState = state.clone()
    ..selectPic = action.payload;
  return newState;
}

DynamicDetailsState _onResetData(DynamicDetailsState state, Action action) {
  final DynamicDetailsState newState = state.clone()
    ..commentData = action.payload;
  return newState;
}

DynamicDetailsState _onSetReplyInfo(DynamicDetailsState state, Action action) {
  final DynamicDetailsState newState = state.clone()
    ..replyInfo = action.payload;
  newState.commentEditingController.text = "";
  return newState;
}
