import 'package:fish_redux/fish_redux.dart';

enum CommunityAction {
  action,
  Refresh,
  LoadMore,
  ResetPageData,
  AddPageListData
}

class CommunityActionCreator {
  static Action onAction() {
    return const Action(CommunityAction.action);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(CommunityAction.Refresh, payload: map);
  }

  static Action onLoadMore(Map<String, dynamic> map) {
    return Action(CommunityAction.LoadMore, payload: map);
  }

  static Action onAddPageListData(Map<String, dynamic> map) {
    return Action(CommunityAction.AddPageListData, payload: map);
  }

  static Action onResetPageData(Map<String, dynamic> map) {
    return Action(CommunityAction.ResetPageData, payload: map);
  }
}
