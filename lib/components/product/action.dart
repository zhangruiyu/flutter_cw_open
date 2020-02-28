import 'package:fish_redux/fish_redux.dart';

enum AliItemProductAction { action, SkipProductDetailsPage }

class AliItemProductActionCreator {
  static Action onAction() {
    return const Action(AliItemProductAction.action);
  }

  static Action onSkipProductDetailsPage() {
    return const Action(AliItemProductAction.SkipProductDetailsPage);
  }
}
