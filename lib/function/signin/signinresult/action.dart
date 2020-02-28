import 'package:fish_redux/fish_redux.dart';

enum SignInResultDialogAction { action }

class SignInResultDialogActionCreator {
  static Action onAction() {
    return const Action(SignInResultDialogAction.action);
  }
}
