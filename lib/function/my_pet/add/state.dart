import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class PetAddState implements Cloneable<PetAddState> {
  File petAvatar;
  TextEditingController nickTextEditingController;
  int sex;
  TextEditingController sexTextEditingController;
  String birthday;
  TextEditingController birthdayTextEditingController;
  Map<String, int>
      petType; //'value': {'pet_sub_type': info.id, 'pet_type_id': state.id}
  TextEditingController petTypeTextEditingController;
  int petStatus;
  TextEditingController petStatusTextEditingController;

  @override
  PetAddState clone() {
    return PetAddState()
      ..petAvatar = petAvatar
      ..nickTextEditingController = nickTextEditingController
      ..sex = sex
      ..sexTextEditingController = sexTextEditingController
      ..birthday = birthday
      ..birthdayTextEditingController = birthdayTextEditingController
      ..petType = petType
      ..petTypeTextEditingController = petTypeTextEditingController
      ..petStatus = petStatus
      ..petStatusTextEditingController = petStatusTextEditingController;
  }
}

PetAddState initState(Map<String, dynamic> args) {
  return PetAddState()
    ..nickTextEditingController = TextEditingController()
    ..sexTextEditingController = TextEditingController()
    ..birthdayTextEditingController = TextEditingController()
    ..petTypeTextEditingController = TextEditingController()
    ..petStatusTextEditingController = TextEditingController();
}
