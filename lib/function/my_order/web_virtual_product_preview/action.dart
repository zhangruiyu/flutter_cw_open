import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WebVirtualProductPreviewAction { action }

class WebVirtualProductPreviewActionCreator {
  static Action onAction() {
    return const Action(WebVirtualProductPreviewAction.action);
  }
}
