import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemDynamicAdapterAction { action }

class ItemDynamicAdapterActionCreator {
  static Action onAction() {
    return const Action(ItemDynamicAdapterAction.action);
  }
}
