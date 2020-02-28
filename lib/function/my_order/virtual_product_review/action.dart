import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum VirtualProductReviewAction { action }

class VirtualProductReviewActionCreator {
  static Action onAction() {
    return const Action(VirtualProductReviewAction.action);
  }
}
