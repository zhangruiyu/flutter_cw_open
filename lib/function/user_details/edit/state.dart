import 'dart:io';

import 'package:chongmeng/function/user_details/model/user_details_entity.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:city_pickers/modal/result.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class UserDetailsEditState implements Cloneable<UserDetailsEditState> {
  TextEditingController nickTextEditingController;
  TextEditingController descriptionTextEditingController;
  TextEditingController sexTextEditingController;
  TextEditingController cityTextEditingController;

  File localAvatar;
  int localSex;

  Result cityResult;
  UserDetailsData data;

  @override
  UserDetailsEditState clone() {
    return UserDetailsEditState()
      ..data = data
      ..localAvatar = localAvatar
      ..localSex = localSex
      ..sexTextEditingController = sexTextEditingController
      ..nickTextEditingController = nickTextEditingController
      ..cityTextEditingController = cityTextEditingController
      ..cityResult = cityResult
      ..descriptionTextEditingController = descriptionTextEditingController;
  }
}

UserDetailsEditState initState(Map<String, dynamic> args) {
  var user = (args['userData'] as UserDetailsData);
  var nick = user.nickName;
  var description = user.description;
  return UserDetailsEditState()
    ..nickTextEditingController = TextEditingController(text: nick)
    ..cityTextEditingController = TextEditingController(
        text: user.provincename + user.cityname + user.areaname)
    ..sexTextEditingController =
        TextEditingController(text: user.sex == 1 ? "男" : "女")
    ..descriptionTextEditingController =
        TextEditingController(text: description)
    ..data = args['userData'];
}
