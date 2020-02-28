import 'package:fish_redux/fish_redux.dart';

enum ReplyAction { action, SkipReviewImagePage }

class ReplyActionCreator {
  static Action onAction() {
    return const Action(ReplyAction.action);
  }

  static Action onSkipReviewImagePage(String image) {
    return Action(ReplyAction.SkipReviewImagePage, payload: image);
  }
}
