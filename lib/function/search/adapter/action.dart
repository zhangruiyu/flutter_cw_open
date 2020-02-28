import 'package:fish_redux/fish_redux.dart';

enum SearchListAction { action }

class SearchListActionCreator {
  static Action onAction() {
    return const Action(SearchListAction.action);
  }
}
