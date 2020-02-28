import 'package:fish_redux/fish_redux.dart';

enum RechargeAction { Pay, ChangeSelectPosition, Refresh, ReSetData }

class RechargeActionCreator {
  static Action onPay() {
    return const Action(RechargeAction.Pay);
  }

  static Action onChangeSelectPosition(int index) {
    return Action(RechargeAction.ChangeSelectPosition, payload: index);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(RechargeAction.Refresh, payload: map);
  }

  static Action onReSetData(data) {
    return Action(RechargeAction.ReSetData, payload: data);
  }
}
