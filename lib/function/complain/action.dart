import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ComplainAction { action, ChangePosition }

class ComplainActionCreator {
  static Action onAction() {
    return const Action(ComplainAction.action);
  }

  static Action onChangePosition(int index) {
    return Action(ComplainAction.ChangePosition, payload: index);
  }
}
