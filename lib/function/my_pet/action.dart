import 'package:fish_redux/fish_redux.dart';

import 'model/pet_entity.dart';

enum MyPetAction { ResetData, Refresh, SkipAddPetPage }

class MyPetActionCreator {
  static Action onResetData(List<PetData> data) {
    return Action(MyPetAction.ResetData, payload: data);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(MyPetAction.Refresh, payload: map);
  }

  static Action onSkipAddPetPage() {
    return Action(MyPetAction.SkipAddPetPage);
  }
}
