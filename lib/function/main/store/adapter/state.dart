import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class IntegralStoreState implements Cloneable<IntegralStoreState> {
  IntegralCommodityData integralCommodityData;

  @override
  IntegralStoreState clone() {
    return IntegralStoreState()..integralCommodityData = integralCommodityData;
  }
}

IntegralStoreState initState(Map<String, dynamic> args) {
  return IntegralStoreState();
}
