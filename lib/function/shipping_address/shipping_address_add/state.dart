import 'package:fish_redux/fish_redux.dart';
import 'package:city_pickers/city_pickers.dart' as city;
import 'package:flutter/cupertino.dart';

class ShippingAddressAddState implements Cloneable<ShippingAddressAddState> {
  city.Result result;
  TextEditingController consigneeTextEditingController;
  TextEditingController telTextEditingController;
  TextEditingController addressTextEditingController;
  TextEditingController areaTextEditingController;

  @override
  ShippingAddressAddState clone() {
    return ShippingAddressAddState()
      ..result = result
      ..consigneeTextEditingController = consigneeTextEditingController
      ..telTextEditingController = telTextEditingController
      ..areaTextEditingController = areaTextEditingController
      ..addressTextEditingController = addressTextEditingController;
  }
}

ShippingAddressAddState initState(Map<String, dynamic> args) {
  return ShippingAddressAddState()
    ..consigneeTextEditingController = TextEditingController()
    ..telTextEditingController = TextEditingController()
    ..areaTextEditingController = TextEditingController()
    ..addressTextEditingController = TextEditingController();
}
