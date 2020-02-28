import 'dart:async';

import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'model/details_entity.dart';

class ProductDetailsState implements Cloneable<ProductDetailsState> {
  AliProductItem itemData;
  DetailsEntity detailsEntity;

  Completer<WebViewController> controller = Completer<WebViewController>();

  ProductDetailsState({this.itemData});

  @override
  ProductDetailsState clone() {
    return ProductDetailsState()
      ..itemData = itemData
      ..detailsEntity = detailsEntity
      ..controller = controller;
  }
}

ProductDetailsState initState(Map<String, dynamic> args) {
  return ProductDetailsState(itemData: args['data']);
}
