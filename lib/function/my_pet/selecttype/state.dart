import 'package:fish_redux/fish_redux.dart';

import 'model/pet_type_entity.dart';

class SelectTypeState implements Cloneable<SelectTypeState> {
  List<PetTypeData> data;

  @override
  SelectTypeState clone() {
    return SelectTypeState()..data = data;
  }
}

SelectTypeState initState(Map<String, dynamic> args) {
  return SelectTypeState()..data = args['petTypeEntity'];
  ;
}
