import 'package:chongmeng/function/my_order/virtual_product_review/model/virtual_pruduct.dart';
import 'package:fish_redux/fish_redux.dart';

import 'model/my_order_entity.dart';

enum MyOrderAction {
  ResetPageData,
  Refresh,
  SkipReviewPage,
  ShowOrderAddress,
  ShowExpress,
  SkipMap
}

class MyOrderActionCreator {
  static Action onResetPageData(MyOrderData data) {
    return Action(MyOrderAction.ResetPageData, payload: data);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(MyOrderAction.Refresh, payload: map);
  }

  static Action onSkipReviewPage(
      List<VirtualProduct> virtualProduct, int productType) {
    return Action(MyOrderAction.SkipReviewPage, payload: {
      'virtualProduct': virtualProduct,
      "productType": productType
    });
  }

  static Action onShowOrderAddress(
      String tel, String consigneeName, String addressDetail) {
    return Action(MyOrderAction.ShowOrderAddress, payload: {
      'tel': tel,
      'consigneeName': consigneeName,
      'addressDetail': addressDetail,
    });
  }

  static Action onShowExpress(MyOrderDataStoreorder orderData) {
    return Action(MyOrderAction.ShowExpress, payload: orderData);
  }

  static Action onSkipMap(MyOrderDataMovieorder orderData) {
    return Action(MyOrderAction.SkipMap, payload: orderData);
  }
}
