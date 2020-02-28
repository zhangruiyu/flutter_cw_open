import 'package:fish_redux/fish_redux.dart';

enum ReviewIVAction { SkipCommitPage }

class ReviewIVActionCreator {
  static Action onSkipCommitPage() {
    return const Action(ReviewIVAction.SkipCommitPage);
  }
}
