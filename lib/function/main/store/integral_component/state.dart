import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class IntegralItemState implements Cloneable<IntegralItemState> {
  var index;
  IntegralCommodityDataIntegralcommodity itemData;

  IntegralItemState({this.index, this.itemData});

  @override
  IntegralItemState clone() {
    return IntegralItemState()
      ..index = index
      ..itemData = itemData;
  }
}

IntegralItemState initState(Map<String, dynamic> args) {
  return IntegralItemState();
}
