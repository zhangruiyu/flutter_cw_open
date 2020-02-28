import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ShippingAddressState> buildReducer() {
  return asReducer(
    <Object, Reducer<ShippingAddressState>>{
      ShippingAddressAction.ResetData: _onResetData,
    },
  );
}

ShippingAddressState _onResetData(ShippingAddressState state, Action action) {
  final ShippingAddressState newState = state.clone()..data = action.payload;
  return newState;
}
