import 'package:fish_redux/fish_redux.dart';

enum ShippingAddressAction { Refresh, SkipAddAddress, ResetData }

class ShippingAddressActionCreator {
  static Action onRefresh(Map<String, dynamic> map) {
    return Action(ShippingAddressAction.Refresh, payload: map);
  }

  static Action onSkipAddAddress() {
    return const Action(ShippingAddressAction.SkipAddAddress);
  }

  static Action onResetData(data) {
    return Action(ShippingAddressAction.ResetData, payload: data);
  }
}
