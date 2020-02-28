import 'package:fish_redux/fish_redux.dart';

import 'model/safe_entity.dart';

class SafeCenterState implements Cloneable<SafeCenterState> {
  SafeData data;

  @override
  SafeCenterState clone() {
    return SafeCenterState()..data = data;
  }
}

SafeCenterState initState(Map<String, dynamic> args) {
  return SafeCenterState();
}
