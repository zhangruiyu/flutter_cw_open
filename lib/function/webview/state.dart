import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewState implements Cloneable<WebviewState> {
  Completer<WebViewController> controller = Completer<WebViewController>();
  String url;
  String title;

  @override
  WebviewState clone() {
    return WebviewState()
      ..controller = controller
      ..title = title
      ..url = url;
  }
}

WebviewState initState(Map<String, dynamic> args) {
  return WebviewState()
    ..url = args['url']
    ..title = args['title'];
}
