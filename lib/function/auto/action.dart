import 'package:fish_redux/fish_redux.dart';

enum AutoAction { CheckOK, SendAutoCode, Login }

class AutoActionCreator {
  static Action onCheckOK(bool isOK) {
    return Action(AutoAction.CheckOK, payload: isOK);
  }

  static Action onSendAutoCode(Map<String, dynamic> map) {
    return Action(AutoAction.SendAutoCode, payload: map);
  }

  static Action onLogin(String type) {
    return Action(AutoAction.Login, payload: type);
  }
}
