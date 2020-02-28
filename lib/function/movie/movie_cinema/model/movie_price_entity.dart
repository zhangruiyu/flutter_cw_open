import 'package:chongmeng/generated/json/base/json_convert_content.dart';
import 'package:chongmeng/generated/json/base/json_filed.dart';

class MoviePriceEntity with JsonConvert<MoviePriceEntity> {
  int status;
  String msg;
  MoviePriceData data;
}

class MoviePriceData with JsonConvert<MoviePriceData> {
  double itemMoney;
}
