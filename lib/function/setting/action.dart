import 'package:fish_redux/fish_redux.dart';

enum SettingAction { action }

class SettingActionCreator {
  static Action onAction() {
    return const Action(SettingAction.action);
  }
}
