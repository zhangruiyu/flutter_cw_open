import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WebviewAction { action }

class WebviewActionCreator {
  static Action onAction() {
    return const Action(WebviewAction.action);
  }
}
