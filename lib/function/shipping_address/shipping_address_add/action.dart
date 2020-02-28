import 'package:city_pickers/modal/result.dart';
import 'package:fish_redux/fish_redux.dart';

enum ShippingAddressAddAction { action, SelectCity, SetCity, CommitAddress }

class ShippingAddressAddActionCreator {
  static Action onAction() {
    return const Action(ShippingAddressAddAction.action);
  }

  static Action onSelectCity() {
    return const Action(ShippingAddressAddAction.SelectCity);
  }

  static Action onSetCity(Result result) {
    return Action(ShippingAddressAddAction.SetCity, payload: result);
  }

  static Action onCommitAddress() {
    return Action(ShippingAddressAddAction.CommitAddress);
  }
}
