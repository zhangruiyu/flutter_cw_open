import 'package:fish_redux/fish_redux.dart';

enum SearchFiltrateAction { SetType, SetTypeAndSearch }

class SearchFiltrateActionCreator {
  static Action onSetType(int type) {
    return Action(SearchFiltrateAction.SetType, payload: type);
  }

  static Action onSetTypeAndSearch(int type) {
    return Action(SearchFiltrateAction.SetTypeAndSearch, payload: type);
  }
}
