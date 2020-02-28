import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'model/sign_list_entity.dart';
import 'state.dart';

Reducer<SignInState> buildReducer() {
  return asReducer(
    <Object, Reducer<SignInState>>{
      SignInAction.SetPageData: _onSetPageData,
    },
  );
}

SignInState _onSetPageData(SignInState state, Action action) {
  final SignInState newState = state.clone()..data = action.payload;
  SignListData signListData = action.payload as SignListData;
  newState.markers.clear();
  signListData.signList?.signTime?.forEach((item) {
    newState.markers[DateTime.parse(item)] = [];
  });
  return newState;
}
