import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:fish_redux/fish_redux.dart';

enum StoreAction { Refresh, ResetPageData }

class StoreActionCreator {
  static Action onRefresh(data) {
    return Action(StoreAction.Refresh, payload: data);
  }

  static Action onResetPageData(IntegralCommodityData map) {
    return Action(StoreAction.ResetPageData, payload: map);
  }
}
