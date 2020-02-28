import 'package:fish_redux/fish_redux.dart';

enum IntegralCommodityDetailAction { Buy, SetTotalIntegral }

class IntegralCommodityDetailActionCreator {
  static Action onBuy() {
    return const Action(IntegralCommodityDetailAction.Buy);
  }

  static Action onSetTotalIntegral(int data) {
    return Action(IntegralCommodityDetailAction.SetTotalIntegral,
        payload: data);
  }
}
