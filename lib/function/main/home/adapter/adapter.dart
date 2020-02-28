import 'package:chongmeng/components/product/component.dart';
import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class HomeListAdapter extends DynamicFlowAdapter<HomeListState> {
  HomeListAdapter()
      : super(
          pool: <String, Component<Object>>{
            'product': AliItemProductComponent()
          },
          connector: _HomeListConnector(),
          reducer: buildReducer(),
        );
}

class _HomeListConnector extends ConnOp<HomeListState, List<ItemBean>> {
  @override
  List<ItemBean> get(HomeListState state) {
    if (state.data?.isEmpty == true) {
      return <ItemBean>[];
    }
    return state.data
        .map<ItemBean>(
            (AliProductItem itemData) => ItemBean("product", itemData))
        .toList(growable: true);
  }

  @override
  void set(HomeListState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
