import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PayResultAction { action }

class PayResultActionCreator {
  static Action onAction() {
    return const Action(PayResultAction.action);
  }
}
