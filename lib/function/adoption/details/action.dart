import 'package:fish_redux/fish_redux.dart';

enum AdoptionDetailsAction { ShowAdoptionDialog }

class AdoptionDetailsActionCreator {
  static Action onShowAdoptionDialog() {
    return const Action(AdoptionDetailsAction.ShowAdoptionDialog);
  }
}
