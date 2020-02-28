import 'dart:async';

import 'package:fish_redux/fish_redux.dart';

class CompleterUtils {
  static void complete(Action action) {
    Map<String, dynamic> payload = action.payload;
    if (payload != null && payload.containsKey('completer')) {
      payload['completer']();
    }
  }

  static Future<void> Function() produceCompleterAction(
      Dispatch dispatch, Action Function(Map<String, dynamic> map) actionFun,
      {void Function(Map<String, dynamic> p) params}) {
    return () {
      final Completer<void> completer = Completer<void>();
      Map<String, dynamic> paramsMap = Map();
      paramsMap['completer'] = () {
        completer.complete();
      };
      if (params != null) {
        params(paramsMap);
      }
      dispatch(actionFun(paramsMap));
      return completer.future;
    };
  }
}
