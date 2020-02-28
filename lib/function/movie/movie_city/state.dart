import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:azlistview/azlistview.dart';
import 'package:fish_redux/fish_redux.dart';

import 'model/cinema_city_entity.dart';

class MovieCityState implements Cloneable<MovieCityState> {
  String suspensionTag;

  List<CinemaCitySuspensionBean> allCity;

  List<CinemaCitySuspensionBean> hotCity;
  String districtText;
  Location location;

  @override
  MovieCityState clone() {
    return MovieCityState()
      ..location = location
      ..districtText = districtText
      ..hotCity = hotCity
      ..allCity = allCity
      ..suspensionTag = suspensionTag;
  }
}

MovieCityState initState(Map<String, dynamic> args) {
  return MovieCityState()..districtText = "正在定位";
}

class CinemaCitySuspensionBean extends ISuspensionBean {
  String name;
  String tagIndex;
  int id;

  String namePinyin;

  CinemaCitySuspensionBean({this.name, this.tagIndex, this.id});

  @override
  String getSuspensionTag() {
    return tagIndex;
  }
}
