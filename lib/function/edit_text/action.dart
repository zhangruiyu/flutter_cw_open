import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum EditTextAction { action }

class EditTextActionCreator {
  static Action onAction() {
    return const Action(EditTextAction.action);
  }
}
