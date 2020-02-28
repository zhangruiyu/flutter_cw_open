import 'package:fish_redux/fish_redux.dart';

enum HomeAction { Refresh, SetHomeData }

class HomeActionCreator {
  static Action onRefresh(data) {
    return Action(HomeAction.Refresh, payload: data);
  }

  static Action onSetHomeData(data) {
    return Action(HomeAction.SetHomeData, payload: data);
  }
}
