import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeListAction { action }

class HomeListActionCreator {
  static Action onAction() {
    return const Action(HomeListAction.action);
  }
}
