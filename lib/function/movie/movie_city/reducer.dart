import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:azlistview/azlistview.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:lpinyin/lpinyin.dart';

import 'action.dart';
import 'model/cinema_city_entity.dart';
import 'state.dart';

Reducer<MovieCityState> buildReducer() {
  return asReducer(
    <Object, Reducer<MovieCityState>>{
      MovieCityAction.ResetData: _onResetData,
      MovieCityAction.ChangeTag: _onChangeTag,
      MovieCityAction.SetDistrictText: _onSetDistrictText,
    },
  );
}

MovieCityState _onChangeTag(MovieCityState state, Action action) {
  return state.clone()..suspensionTag = action.payload;
}

MovieCityState _onSetDistrictText(MovieCityState state, Action action) {
  return state.clone()
    ..districtText = action.payload['district']
    ..location = action.payload['location'];
}

MovieCityState _onResetData(MovieCityState state, Action action) {
  CinemaCityData data = action.payload;
  final MovieCityState newState = state.clone()
    ..allCity = _handleList((data.allCity).map((item) {
      return CinemaCitySuspensionBean(
        name: item.name,
        id: item.id,
      );
    }).toList())
    ..hotCity = (data.hotCity).map((item) {
      return CinemaCitySuspensionBean(
          name: item.name, id: item.id, tagIndex: "★");
    }).toList();
  println(newState.hotCity);
  println("""newState.hotCity""");
  newState.suspensionTag = newState.hotCity[0].getSuspensionTag();
  return newState;
}

List<CinemaCitySuspensionBean> _handleList(
    List<CinemaCitySuspensionBean> list) {
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
