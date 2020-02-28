import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<UserDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<UserDetailsState>>{
      UserDetailsAction.SetUserData: _onSetUserData,
      UserDetailsAction.ResetPageData: _onResetPageData,
      UserDetailsAction.AddPageListData: _onAddPageListData,
    },
  );
}

UserDetailsState _onSetUserData(UserDetailsState state, Action action) {
  final UserDetailsState newState = state.clone()..data = action.payload;
  return newState;
}

UserDetailsState _onResetPageData(UserDetailsState state, Action action) {
  final UserDetailsState newState = state.clone();
  String filtrateType = action.payload['filtrateType'];
  newState.pageData[filtrateType].data = action.payload['data'];
  newState.pageData[filtrateType].pageIndex = action.payload['pageIndex'];
  return newState;
}

UserDetailsState _onAddPageListData(UserDetailsState state, Action action) {
  final UserDetailsState newState = state.clone();
  String filtrateType = action.payload['filtrateType'];
  newState.pageData[filtrateType].data.addAll(action.payload['data']);
  newState.pageData[filtrateType].pageIndex = action.payload['pageIndex'];
  return newState;
}
