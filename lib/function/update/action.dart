import 'package:fish_redux/fish_redux.dart';

enum UpdateAction { UpdateProgress, StartDown }

class UpdateActionCreator {
  static Action onUpdateProgress(progress) {
    return Action(UpdateAction.UpdateProgress, payload: progress);
  }

  static Action onStartDown() {
    return const Action(UpdateAction.StartDown);
  }
}
