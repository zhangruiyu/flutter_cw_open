import 'package:fish_redux/fish_redux.dart';

enum SelectTypeAction { SkipSelectSubTypePage }

class SelectTypeActionCreator {
  static Action onSkipSelectSubTypePage(type) {
    return Action(SelectTypeAction.SkipSelectSubTypePage, payload: type);
  }
}
