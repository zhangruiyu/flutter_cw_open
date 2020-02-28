import 'package:fish_redux/fish_redux.dart';

import 'model/user_details_entity.dart';

enum UserDetailsAction {
  SetUserData,
  Refresh,
  SkipEditUserPage,
  RefreshDynamic,
  LoadMoreDynamic,
  ResetPageData,
  AddPageListData,
  SkipConversationPage
}

class UserDetailsActionCreator {
  static Action onSetUserData(UserDetailsData data) {
    return Action(UserDetailsAction.SetUserData, payload: data);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(UserDetailsAction.Refresh, payload: map);
  }

  static Action onRefreshDynamic(Map<String, dynamic> map) {
    return Action(UserDetailsAction.RefreshDynamic, payload: map);
  }

  static Action onLoadMoreDynamic(Map<String, dynamic> map) {
    return Action(UserDetailsAction.LoadMoreDynamic, payload: map);
  }

  static Action onSkipEditUserPage() {
    return const Action(UserDetailsAction.SkipEditUserPage);
  }

  static Action onAddPageListData(Map<String, dynamic> map) {
    return Action(UserDetailsAction.AddPageListData, payload: map);
  }

  static Action onResetPageData(Map<String, dynamic> map) {
    return Action(UserDetailsAction.ResetPageData, payload: map);
  }

  static Action onSkipConversationPage() {
    return Action(
      UserDetailsAction.SkipConversationPage,
    );
  }
}
