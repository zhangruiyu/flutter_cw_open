import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:chongmeng/widget/commodity_count.dart';
import 'package:fish_redux/fish_redux.dart';

class IntegralCommodityDetailState
    implements Cloneable<IntegralCommodityDetailState> {
  int index;
  IntegralCommodityDataIntegralcommodity itemData;
  CommodityCountController commodityCountController;
  int totalIntegral;

  @override
  IntegralCommodityDetailState clone() {
    return IntegralCommodityDetailState()
      ..totalIntegral = totalIntegral
      ..index = index
      ..itemData = itemData
      ..commodityCountController = commodityCountController;
  }
}

IntegralCommodityDetailState initState(Map<String, dynamic> args) {
  return IntegralCommodityDetailState()
    ..itemData = args['itemData']
    ..commodityCountController = CommodityCountController()
    ..index = args['index'];
}
