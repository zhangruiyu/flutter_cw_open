import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CommunityState> buildReducer() {
  return asReducer(
    <Object, Reducer<CommunityState>>{
      CommunityAction.ResetPageData: _onResetPageData,
      CommunityAction.AddPageListData: _onAddPageListData,
    },
  );
}

CommunityState _onResetPageData(CommunityState state, Action action) {
  final CommunityState newState = state.clone();
  String filtrateType = action.payload['filtrateType'];
  newState.pageData[filtrateType].data = action.payload['data'];
  newState.pageData[filtrateType].pageIndex = action.payload['pageIndex'];
  return newState;
}

CommunityState _onAddPageListData(CommunityState state, Action action) {
  final CommunityState newState = state.clone();
  String filtrateType = action.payload['filtrateType'];
  newState.pageData[filtrateType].data.addAll(action.payload['data']);
  newState.pageData[filtrateType].pageIndex = action.payload['pageIndex'];
  return newState;
}
