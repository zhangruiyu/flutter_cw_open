import 'package:fish_redux/fish_redux.dart';

enum SelectSubTypeAction { SelectSubType }

class SelectSubTypeActionCreator {
  static Action onSelectSubType(p) {
    return Action(SelectSubTypeAction.SelectSubType, payload: p);
  }
}
