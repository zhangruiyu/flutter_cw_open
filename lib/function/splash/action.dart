import 'package:fish_redux/fish_redux.dart';

enum SplashAction { PushMainPage, ChangeTimeValue }

class SplashActionCreator {
  static Action onPushMainPage() {
    return const Action(SplashAction.PushMainPage);
  }

  static Action onChangeTimeValue(int n) {
    return Action(SplashAction.ChangeTimeValue, payload: n);
  }
}
