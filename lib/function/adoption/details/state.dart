import 'package:chongmeng/function/main/adoption/model/adoption_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class AdoptionDetailsState implements Cloneable<AdoptionDetailsState> {
  AdoptionDataAdoption data;

  @override
  AdoptionDetailsState clone() {
    return AdoptionDetailsState()..data = data;
  }
}

AdoptionDetailsState initState(Map<String, dynamic> args) {
  return AdoptionDetailsState()..data = args['data'];
}
