import 'package:fish_redux/fish_redux.dart';

enum PetAddAction {
  SetAvatarPath,
  SelectPetAvatar,
  AddPet,
  SelectType,
  SetType
}

class PetAddActionCreator {
  static Action onSetAvatarPath(image) {
    return Action(PetAddAction.SetAvatarPath, payload: image);
  }

  static Action onSelectPetAvatar() {
    return const Action(PetAddAction.SelectPetAvatar);
  }

  static Action onAddPet() {
    return Action(PetAddAction.AddPet);
  }

  static Action onSelectType(type) {
    return Action(PetAddAction.SelectType, payload: type);
  }

  static Action onSetType(selectResult) {
    return Action(PetAddAction.SetType, payload: selectResult);
  }
}
