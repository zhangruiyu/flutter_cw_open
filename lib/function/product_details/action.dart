import 'package:fish_redux/fish_redux.dart';

enum ProductDetailsAction { SetDetailsData, Refresh, Share, SkipBuyPage }

class ProductDetailsActionCreator {
  static Action onSetDetailsData(data) {
    return Action(ProductDetailsAction.SetDetailsData, payload: data);
  }

  static Action onRefresh(data) {
    return Action(ProductDetailsAction.Refresh, payload: data);
  }

  static Action onShare() {
    return Action(ProductDetailsAction.Share);
  }

  static Action onSkipBuyPage() {
    return Action(ProductDetailsAction.SkipBuyPage);
  }
}
