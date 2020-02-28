import 'package:chongmeng/generated/json/base/json_convert_content.dart';
import 'package:chongmeng/generated/json/base/json_filed.dart';

class SearchCinemaEntity with JsonConvert<SearchCinemaEntity> {
  SearchCinemaCinemas cinemas;
}

class SearchCinemaCinemas with JsonConvert<SearchCinemaCinemas> {
  @JSONField(name: "list")
  List<SearchCinemaCinemasList> xList;
  int total;
  int type;
}

class SearchCinemaCinemasList with JsonConvert<SearchCinemaCinemasList> {
  int id;
  String nm;
  String sellPrice;
  String referencePrice;
  String addr;
  bool sell;
  int deal;
  List<String> hallType;
  int allowRefund;
  int endorse;
  int snack;
  String vipDesc;
  String distance;
}
