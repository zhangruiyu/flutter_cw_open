import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:chongmeng/function/movie/movie_city/model/cinema_city_entity.dart';
import 'package:fish_redux/fish_redux.dart';

enum MovieCityAction {
  ResetData,
  Refresh,
  ChangeTag,
  SelectCity,
  SetDistrictText
}

class MovieCityActionCreator {
  static Action onRefresh(p) {
    return Action(MovieCityAction.Refresh, payload: p);
  }

  static Action onResetData(CinemaCityData data) {
    return Action(MovieCityAction.ResetData, payload: data);
  }

  static Action onChangeTag(String data) {
    return Action(MovieCityAction.ChangeTag, payload: data);
  }

  static Action onSetDistrictText(Map data) {
    return Action(MovieCityAction.SetDistrictText, payload: data);
  }

  static Action onSelectCity(int id, String name) {
    return Action(MovieCityAction.SelectCity, payload: {
      'id': id,
      'name': name,
    });
  }
}
