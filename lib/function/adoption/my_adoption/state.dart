import 'package:fish_redux/fish_redux.dart';

import 'model/my_adoption_entity.dart';

class MyAdoptionState implements Cloneable<MyAdoptionState> {
  MyAdoptionData data;

  @override
  MyAdoptionState clone() {
    return MyAdoptionState()..data = data;
  }

  static final publishing = 0; // 发布中
  static final finish = 10; // 已被领养
  static final soldOut = 20; //下架
}

MyAdoptionState initState(Map<String, dynamic> args) {
  return MyAdoptionState();
}
