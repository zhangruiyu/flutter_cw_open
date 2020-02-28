import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IntegralRecordState> buildReducer() {
  return asReducer(
    <Object, Reducer<IntegralRecordState>>{
      IntegralRecordAction.AddPageListData: _onAddPageListData,
      IntegralRecordAction.AddPageMoreListData: _onAddPageMoreListData,
      IntegralRecordAction.SetTotalIntegral: _onSetTotalIntegral,
    },
  );
}

IntegralRecordState _onAddPageListData(
    IntegralRecordState state, Action action) {
  final IntegralRecordState newState = state.clone()
    ..data = action.payload['data'];
  newState.index = 1;
  return newState;
}

IntegralRecordState _onAddPageMoreListData(
    IntegralRecordState state, Action action) {
  final IntegralRecordState newState = state.clone();
  newState.data.addAll(action.payload['data']);
  newState.index = newState.index++;
  return newState;
}

IntegralRecordState _onSetTotalIntegral(
    IntegralRecordState state, Action action) {
  final IntegralRecordState newState = state.clone()
    ..totalIntegral = action.payload;
  return newState;
}
