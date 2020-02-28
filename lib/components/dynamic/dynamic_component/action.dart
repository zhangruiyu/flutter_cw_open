import 'package:fish_redux/fish_redux.dart';

enum DynamicItemAction {
  RequestSetLiked,
  ResetLiked,
  SkipReviewPage,
  SkipDetailsPage
}

class DynamicItemActionCreator {
  static Action onRequestSetLiked(Map<String, dynamic> paramsMap) {
    return Action(DynamicItemAction.RequestSetLiked, payload: paramsMap);
  }

  static Action onResetLiked(paramsMap) {
    return Action(DynamicItemAction.ResetLiked, payload: paramsMap);
  }

  static Action onSkipReviewPage(int index) {
    return Action(DynamicItemAction.SkipReviewPage, payload: index);
  }

  static Action onSkipDetailsPage() {
    return Action(DynamicItemAction.SkipDetailsPage);
  }
}
