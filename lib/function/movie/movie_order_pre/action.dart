import 'package:fish_redux/fish_redux.dart';

enum MovieOrderPreAction { action, Commit }

class MovieOrderPreActionCreator {
  static Action onAction() {
    return const Action(MovieOrderPreAction.action);
  }

  static Action onCommit() {
    return const Action(MovieOrderPreAction.Commit);
  }
}
