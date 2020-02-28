import 'package:fish_redux/fish_redux.dart';

enum SafeCenterAction { BindAndUnBind, Refresh, ResetData }

class SafeCenterActionCreator {
  static Action onBindAndUnBind(String type) {
    return Action(SafeCenterAction.BindAndUnBind, payload: type);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(SafeCenterAction.Refresh, payload: map);
  }

  static Action onResetData(map) {
    return Action(SafeCenterAction.ResetData, payload: map);
  }
}
