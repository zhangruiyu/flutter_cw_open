import 'package:chongmeng/components/notice/component.dart';
import 'package:chongmeng/components/notice/state.dart';
import 'package:chongmeng/function/main/store/integral_component/component.dart';
import 'package:chongmeng/function/main/store/integral_component/state.dart';
import 'package:chongmeng/function/main/store/integral_eleme_component/component.dart';
import 'package:chongmeng/function/main/store/integral_eleme_component/state.dart';
import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class IntegralStoreAdapter extends DynamicFlowAdapter<IntegralStoreState> {
  IntegralStoreAdapter()
      : super(
          pool: <String, Component<Object>>{
            'integraleleme': IntegralElemeItemComponent(),
            'integral': IntegralItemComponent()
          },
          connector: _IntegralStoreConnector(),
          reducer: buildReducer(),
        );
}

class _IntegralStoreConnector
    extends ConnOp<IntegralStoreState, List<ItemBean>> {
  @override
  List<ItemBean> get(IntegralStoreState state) {
    List<ItemBean> items = [];

    if (state.integralCommodityData?.elemo != null) {
      items.add(ItemBean("integraleleme",
          IntegralElemeItemState(itemData: state.integralCommodityData.elemo)));
    }
    if (state.integralCommodityData?.integralCommodity?.isNotEmpty == true) {
      items.addAll(state.integralCommodityData.integralCommodity
          .map<ItemBean>((IntegralCommodityDataIntegralcommodity item) =>
              ItemBean(
                  "integral",
                  IntegralItemState(
                      index: state.integralCommodityData.integralCommodity
                          .indexOf(item),
                      itemData: item)))
          .toList());
    }
    return items;
  }

  @override
  void set(IntegralStoreState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
