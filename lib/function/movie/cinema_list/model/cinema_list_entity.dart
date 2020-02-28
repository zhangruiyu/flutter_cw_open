import 'package:chongmeng/generated/json/base/json_convert_content.dart';
import 'package:chongmeng/generated/json/base/json_filed.dart';

class CinemaListEntity with JsonConvert<CinemaListEntity> {
  List<CinemaListCinema> cinemas;
  @JSONField(name: "ct_pois")
  List<CinemaListCtPoi> ctPois;
  CinemaListPaging paging;
  String resId;
}

class CinemaListCinema with JsonConvert<CinemaListCinema> {
  int id;
  int mark;
  String nm;
  String sellPrice;
  String addr;
  String distance;
  CinemaListCinemasTag tag;
  CinemaListCinemasPromotion promotion;
  String showTimes;
}

class CinemaListCinemasTag with JsonConvert<CinemaListCinemasTag> {
  int allowRefund;
  int buyout;
  int cityCardTag;
  int deal;
  int endorse;
  String giftTag;
  List<String> hallType;
  List<CinemaListCinemasTagHallTypeVOList> hallTypeVOList;
  int sell;
  int snack;
  String vipTag;
}

class CinemaListCinemasTagHallTypeVOList
    with JsonConvert<CinemaListCinemasTagHallTypeVOList> {
  String name;
  String url;
}

class CinemaListCinemasPromotion with JsonConvert<CinemaListCinemasPromotion> {
  String cardPromotionTag;
  String couponPromotionTag;
  String merchantActivityTag;
  String packShowActivityTag;
  String platformActivityTag;
  String starActivityTag;
}

class CinemaListCtPoi with JsonConvert<CinemaListCtPoi> {
  @JSONField(name: "ct_poi")
  String ctPoi;
  int poiid;
}

class CinemaListPaging with JsonConvert<CinemaListPaging> {
  bool hasMore;
  int limit;
  int offset;
  int total;
}
