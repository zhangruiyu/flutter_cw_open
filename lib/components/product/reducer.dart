import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Reducer<AliProductItem> buildReducer() {
  return asReducer(
    <Object, Reducer<AliProductItem>>{
//      AliItemProductAction.action: _onAction,
    },
  );
}

//AliProductItem _onAction(AliProductItem state, Action action) {
//  final AliProductItem newState = state.clone();
//  return newState;
//}
