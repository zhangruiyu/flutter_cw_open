import 'package:fish_redux/fish_redux.dart';

import 'model/pet_entity.dart';

class MyPetState implements Cloneable<MyPetState> {
  List<PetData> data;

  @override
  MyPetState clone() {
    return MyPetState()..data = data;
  }
}

MyPetState initState(Map<String, dynamic> args) {
  return MyPetState();
}
