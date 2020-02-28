import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<StoreState> buildReducer() {
  return asReducer(
    <Object, Reducer<StoreState>>{
      StoreAction.ResetPageData: _onResetPageData,
    },
  );
}

StoreState _onResetPageData(StoreState state, Action action) {
  final StoreState newState = state.clone()
    ..integralCommodityData = action.payload;
  return newState;
}
