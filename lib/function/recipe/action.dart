import 'package:fish_redux/fish_redux.dart';

enum RecipeAction { ResetData, Refresh }

class RecipeActionCreator {
  static Action onResetData(data) {
    return Action(RecipeAction.ResetData, payload: data);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(RecipeAction.Refresh, payload: map);
  }
}
