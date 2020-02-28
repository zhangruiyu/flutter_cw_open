import 'package:chongmeng/function/my_order/model/my_order_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

import 'model/virtual_pruduct.dart';

class VirtualProductReviewState
    implements Cloneable<VirtualProductReviewState> {
  List<VirtualProduct> virtualProduct;
  PageController controller;

  @override
  VirtualProductReviewState clone() {
    return VirtualProductReviewState()
      ..virtualProduct = virtualProduct
      ..controller = controller;
  }
}

VirtualProductReviewState initState(Map<String, dynamic> args) {
  return VirtualProductReviewState()
    ..virtualProduct = args['data']
    ..controller = PageController();
}
