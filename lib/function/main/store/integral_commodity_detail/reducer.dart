import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<IntegralCommodityDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<IntegralCommodityDetailState>>{
      IntegralCommodityDetailAction.SetTotalIntegral: _onSetTotalIntegral,
    },
  );
}

IntegralCommodityDetailState _onSetTotalIntegral(
    IntegralCommodityDetailState state, Action action) {
  final IntegralCommodityDetailState newState = state.clone()
    ..totalIntegral = action.payload;
  return newState;
}
