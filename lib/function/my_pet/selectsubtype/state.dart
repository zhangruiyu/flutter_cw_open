import 'package:azlistview/azlistview.dart';
import 'package:chongmeng/function/my_pet/selectsubtype/view.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:lpinyin/lpinyin.dart';

import 'model/pet_sub_type_entity.dart';

class SelectSubTypeState implements Cloneable<SelectSubTypeState> {
  //总分类id
  int id;
  List<CityInfo> petSubList = List();

  String suspensionTag;

  @override
  SelectSubTypeState clone() {
    return SelectSubTypeState()
      ..id = id
      ..suspensionTag = suspensionTag
      ..petSubList = petSubList;
  }
}

SelectSubTypeState initState(Map<String, dynamic> args) {
  var selectSubTypeState = SelectSubTypeState();
  selectSubTypeState
    ..petSubList =
        _handleList((args['subtype'] as List<PetSubTypeData>).map((item) {
      return CityInfo(
          name: item.name, tagIndex: "★", id: item.id, image: item.image);
    }).toList())
    ..id = args['id'];
  selectSubTypeState.suspensionTag =
      selectSubTypeState.petSubList[0].getSuspensionTag();
  return selectSubTypeState;
}

List<CityInfo> _handleList(List<CityInfo> list) {
  if (list == null || list.isEmpty) return [];
  for (int i = 0, length = list.length; i < length; i++) {
    String pinyin = PinyinHelper.getPinyinE(list[i].name);
    String tag = pinyin.substring(0, 1).toUpperCase();
    list[i].namePinyin = pinyin;
    if (RegExp("[A-Z]").hasMatch(tag)) {
      list[i].tagIndex = tag;
    } else {
      list[i].tagIndex = "#";
    }
  }
  //根据A-Z排序
  SuspensionUtil.sortListBySuspensionTag(list);
  return list;
}
