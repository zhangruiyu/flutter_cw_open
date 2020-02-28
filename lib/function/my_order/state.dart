import 'package:fish_redux/fish_redux.dart';

import 'model/my_order_entity.dart';

class MyOrderState implements Cloneable<MyOrderState> {
  MyOrderData data;

  @override
  MyOrderState clone() {
    return MyOrderState()..data = data;
  }
}

MyOrderState initState(Map<String, dynamic> args) {
  return MyOrderState();
}
