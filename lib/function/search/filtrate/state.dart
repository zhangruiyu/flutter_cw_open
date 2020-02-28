import 'package:fish_redux/fish_redux.dart';

class SearchFiltrateState implements Cloneable<SearchFiltrateState> {
  var type = 0;

  //综合
  static const int synthesize = 0;

  //销量
  static const int volume = 1;

  //价格降序
  static const int price_desc = 2;

  //价格升序
  static const int price_asc = 3;

  @override
  SearchFiltrateState clone() {
    return SearchFiltrateState()..type = type;
  }
}

SearchFiltrateState initState(Map<String, dynamic> args) {
  return SearchFiltrateState()..type = SearchFiltrateState.synthesize;
}
