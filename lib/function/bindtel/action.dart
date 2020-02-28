import 'package:fish_redux/fish_redux.dart';

enum BindTelAction { SendAutoCode, Login, CheckOK }

class BindTelActionCreator {
  static Action onSendAutoCode(map) {
    return Action(BindTelAction.SendAutoCode, payload: map);
  }

  static Action onLogin() {
    return Action(BindTelAction.Login);
  }

  static Action onCheckOK(bool param) {
    return Action(BindTelAction.CheckOK, payload: param);
  }
}
