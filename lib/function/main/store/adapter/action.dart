import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum IntegralStoreAction { action }

class IntegralStoreActionCreator {
  static Action onAction() {
    return const Action(IntegralStoreAction.action);
  }
}
