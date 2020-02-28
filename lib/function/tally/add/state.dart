import 'dart:io';

import 'package:chongmeng/function/tally/entity/tally_tag_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

class AddTallyState implements Cloneable<AddTallyState> {
  TextEditingController remarkTextEditingController;
  TextEditingController priceTextEditingController;
  List<int> selectId;
  File image;
  List<TallyTagData> tags;
  String takeDate;

  @override
  AddTallyState clone() {
    return AddTallyState()
      ..tags = tags
      ..image = image
      ..selectId = selectId
      ..takeDate = takeDate
      ..priceTextEditingController = priceTextEditingController
      ..remarkTextEditingController = remarkTextEditingController;
  }
}

AddTallyState initState(Map<String, dynamic> args) {
  return AddTallyState()
    ..selectId = []
    ..tags = args['tags']
    ..priceTextEditingController = TextEditingController()
    ..remarkTextEditingController = TextEditingController();
}
