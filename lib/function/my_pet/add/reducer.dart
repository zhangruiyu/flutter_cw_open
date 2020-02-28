import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PetAddState> buildReducer() {
  return asReducer(
    <Object, Reducer<PetAddState>>{
      PetAddAction.SetAvatarPath: _onSetAvatarPath,
      PetAddAction.SetType: _onSetType,
    },
  );
}

PetAddState _onSetAvatarPath(PetAddState state, Action action) {
  final PetAddState newState = state.clone()..petAvatar = action.payload;
  return newState;
}

PetAddState _onSetType(PetAddState state, Action action) {
  final PetAddState newState = state.clone();
  Map<String, dynamic> params = action.payload;
  if (params['type'] == "birthday") {
    newState
      ..birthday = params['value']
      ..birthdayTextEditingController.text = params['key'];
  } else if (params['type'] == "sex") {
    newState
      ..sex = params['value']
      ..sexTextEditingController.text = params['key'];
  } else if (params['type'] == "status") {
    newState
      ..petStatus = params['value']
      ..petStatusTextEditingController.text = params['key'];
  } else if (params['type'] == "petType") {
    newState
      ..petType = params['value']
      ..petTypeTextEditingController.text = params['key'];
  }
  return newState;
}
