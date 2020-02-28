import 'package:chongmeng/components/notice/state.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:fish_redux/fish_redux.dart';

import 'adapter/state.dart';
import 'model/integral_commodity_entity.dart';

class StoreState implements Cloneable<StoreState> {
  HomeData storeData;

  IntegralCommodityData integralCommodityData;

  @override
  StoreState clone() {
    return StoreState()..integralCommodityData = integralCommodityData;
  }

  static StoreState initState(Map<String, dynamic> args) {
    return StoreState();
  }
}

class IntegralStoreConnector extends ConnOp<StoreState, IntegralStoreState> {
  @override
  void set(StoreState state, IntegralStoreState subState) {
    super.set(state, subState);
  }

  @override
  IntegralStoreState get(StoreState state) {
    return IntegralStoreState()
      ..integralCommodityData = state.integralCommodityData;
  }
}

class IntegralNoticeConnector extends ConnOp<StoreState, NoticeState> {
  @override
  void set(StoreState state, NoticeState subState) {
    super.set(state, subState);
  }

  @override
  NoticeState get(StoreState state) {
    return NoticeState()..itemData = state.integralCommodityData?.sysNotices;
  }
}
