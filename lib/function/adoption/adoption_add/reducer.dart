import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AdoptionAddState> buildReducer() {
  return asReducer(
    <Object, Reducer<AdoptionAddState>>{
      AdoptionAddAction.ChangeSelectPic: _onChangeSelectPic,
      AdoptionAddAction.SetType: _onSetType,
      AdoptionAddAction.SetMoneyType: _onSetMoneyType,
    },
  );
}

AdoptionAddState _onChangeSelectPic(AdoptionAddState state, Action action) {
  final AdoptionAddState newState = state.clone()
    ..selectPicList = action.payload;
  return newState;
}

AdoptionAddState _onSetType(AdoptionAddState state, Action action) {
  final AdoptionAddState newState = state.clone();
  Map<String, dynamic> params = action.payload;
  if (params['type'] == "petTypeId") {
    newState
      ..petTypeId = params['value']['pet_type_id']
      ..petSubTypeId = params['value']['pet_sub_type']
      ..petTypeIdTextEditingController.text = params['key'];
  } else if (params['type'] == "sex") {
    newState
      ..sex = params['value']
      ..sexTextEditingController.text = params['key'];
  } else if (params['type'] == "isExpellingParasite") {
    newState
      ..isExpellingParasite = params['value']
      ..isExpellingParasiteTextEditingController.text = params['key'];
  } else if (params['type'] == "isSterilization") {
    newState
      ..isSterilization = params['value']
      ..isSterilizationTextEditingController.text = params['key'];
  } else if (params['type'] == "isImmune") {
    newState
      ..isImmune = params['value']
      ..isImmuneTextEditingController.text = params['key'];
  } else if (params['type'] == "cityCode") {
    newState
      ..city = params['value']
      ..cityTextEditingController.text = params['key'];
  }

  return newState;
}

AdoptionAddState _onSetMoneyType(AdoptionAddState state, Action action) {
  final AdoptionAddState newState = state.clone()
    ..adoptionType = action.payload;

  return newState;
}
