import 'package:fish_redux/fish_redux.dart';

enum TallyAction { action, SkipAddTallyPage, Refresh, AddPageListData }

class TallyActionCreator {
  static Action onAction() {
    return const Action(TallyAction.action);
  }

  static Action onSkipAddTallyPage() {
    return const Action(TallyAction.SkipAddTallyPage);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(TallyAction.Refresh, payload: map);
  }

  static Action onAddPageListData(Map<String, dynamic> map) {
    return Action(TallyAction.AddPageListData, payload: map);
  }
}
