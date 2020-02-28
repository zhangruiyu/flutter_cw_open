import 'package:fish_redux/fish_redux.dart';

enum ReviewImageAction { action }

class ReviewImageActionCreator {
  static Action onAction() {
    return const Action(ReviewImageAction.action);
  }
}
