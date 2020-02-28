import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NoticeAction { action }

class NoticeActionCreator {
  static Action onAction() {
    return const Action(NoticeAction.action);
  }
}
