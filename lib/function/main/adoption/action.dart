import 'package:fish_redux/fish_redux.dart';

import 'model/adoption_entity.dart';

enum AdoptionAction { ResetData, Refresh, SkipDetailsPage }

class AdoptionActionCreator {
  static Action onRefresh(Map<String, dynamic> map) {
    return Action(AdoptionAction.Refresh, payload: map);
  }

  static Action onSkipDetailsPage(AdoptionDataAdoption data) {
    return Action(AdoptionAction.SkipDetailsPage, payload: data);
  }

  static Action onResetData(AdoptionData data) {
    return Action(AdoptionAction.ResetData, payload: data);
  }
}
