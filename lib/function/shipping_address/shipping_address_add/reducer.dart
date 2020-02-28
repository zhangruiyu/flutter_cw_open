import 'package:city_pickers/city_pickers.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ShippingAddressAddState> buildReducer() {
  return asReducer(
    <Object, Reducer<ShippingAddressAddState>>{
      ShippingAddressAddAction.SetCity: _onSetCity,
    },
  );
}

ShippingAddressAddState _onSetCity(
    ShippingAddressAddState state, Action action) {
  Result payload = action.payload;
  final ShippingAddressAddState newState = state.clone()..result = payload;
  state.areaTextEditingController.text = payload == null
      ? ""
      : "${payload.provinceName + "  " + payload.cityName + "  " + payload.areaName}";
  return newState;
}
