import 'package:fish_redux/fish_redux.dart';

import 'model/shipping_address_entity.dart';

class ShippingAddressState implements Cloneable<ShippingAddressState> {
  List<ShippingAddressData> data;
  int type;
  static int SEE = 0;
  static int SELECT = 1;

  @override
  ShippingAddressState clone() {
    return ShippingAddressState()..data = data;
  }
}

ShippingAddressState initState(Map<String, dynamic> args) {
  return ShippingAddressState()..type = args["type"];
}
