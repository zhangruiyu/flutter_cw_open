import 'package:fish_redux/fish_redux.dart';

enum AppInfoAction { action }

class AppInfoActionCreator {
  static Action onAction() {
    return const Action(AppInfoAction.action);
  }
}
