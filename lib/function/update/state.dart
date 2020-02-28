import 'dart:async';

import 'package:fish_redux/fish_redux.dart';

import 'model/update_entity.dart';

class UpdateState implements Cloneable<UpdateState> {
  UpdateData data;

  // 进度订阅
  StreamSubscription downloadSubscription;

  int percent;

  @override
  UpdateState clone() {
    return UpdateState()
      ..data = data
      ..downloadSubscription = downloadSubscription
      ..percent = percent;
  }
}

UpdateState initState(Map<String, dynamic> args) {
  return UpdateState()
    ..data = args['data']
    ..percent = 0;
}
