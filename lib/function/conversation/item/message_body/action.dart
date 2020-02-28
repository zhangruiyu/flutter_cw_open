import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MessageBodyAction { action }

class MessageBodyActionCreator {
  static Action onAction() {
    return const Action(MessageBodyAction.action);
  }
}
