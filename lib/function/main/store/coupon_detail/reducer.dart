import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CouponDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<CouponDetailState>>{
      CouponDetailAction.SetCoupon: _onSetCoupon,
      CouponDetailAction.ChangeSelectPosition: _onChangeSelectPosition,
      CouponDetailAction.ElemeCode: _onElemeCode,
    },
  );
}

CouponDetailState _onSetCoupon(CouponDetailState state, Action action) {
  final CouponDetailState newState = state.clone()
    ..data = action.payload
    ..positionType = null;
  return newState;
}

CouponDetailState _onChangeSelectPosition(
    CouponDetailState state, Action action) {
  final CouponDetailState newState = state.clone()..position = action.payload;
  return newState;
}

CouponDetailState _onElemeCode(CouponDetailState state, Action action) {
  final CouponDetailState newState = state.clone()
    ..positionType = action.payload;
  return newState;
}
