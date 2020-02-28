import 'package:fish_redux/fish_redux.dart';

enum SelectTalkTypeAction { SkipPage }

class SelectTalkTypeActionCreator {
  static Action onSkipPage(String type) {
    return Action(SelectTalkTypeAction.SkipPage, payload: type);
  }
}
