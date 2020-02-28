import 'package:fish_redux/fish_redux.dart';

enum IntegralElemeItemAction { action, SkipElemeDetailPage }

class IntegralElemeItemActionCreator {
  static Action onAction() {
    return const Action(IntegralElemeItemAction.action);
  }

  static Action onSkipElemeDetailPage() {
    return const Action(IntegralElemeItemAction.SkipElemeDetailPage);
  }
}
