import 'package:fish_redux/fish_redux.dart';

enum BannerAction { SkipWebViewPage }

class BannerActionCreator {
  static Action onSkipWebViewPage(data) {
    return Action(BannerAction.SkipWebViewPage, payload: data);
  }
}
