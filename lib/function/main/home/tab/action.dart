import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TabAction { action }

class TabActionCreator {
  static Action onAction() {
    return const Action(TabAction.action);
  }
}
