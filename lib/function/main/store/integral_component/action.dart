import 'package:fish_redux/fish_redux.dart';

enum IntegralItemAction { SkipIntegralCommodityDetailPage }

class IntegralItemActionCreator {
  static Action onSkipIntegralCommodityDetailPage() {
    return const Action(IntegralItemAction.SkipIntegralCommodityDetailPage);
  }
}
