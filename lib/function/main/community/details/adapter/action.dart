import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ReplyListAction { action }

class ReplyListActionCreator {
  static Action onAction() {
    return const Action(ReplyListAction.action);
  }
}
