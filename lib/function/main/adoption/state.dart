import 'package:fish_redux/fish_redux.dart';

import 'model/adoption_entity.dart';

class AdoptionState implements Cloneable<AdoptionState> {
  AdoptionData data;

  @override
  AdoptionState clone() {
    return AdoptionState()..data = data;
  }

  static AdoptionState initState(Map<String, dynamic> args) {
    return AdoptionState();
  }
}
