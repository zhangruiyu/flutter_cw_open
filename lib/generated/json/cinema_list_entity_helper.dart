import 'package:chongmeng/function/movie/cinema_list/model/cinema_list_entity.dart';

cinemaListEntityFromJson(CinemaListEntity data, Map<String, dynamic> json) {
	if (json['cinemas'] != null) {
		data.cinemas = new List<CinemaListCinema>();
		(json['cinemas'] as List).forEach((v) {
			data.cinemas.add(new CinemaListCinema().fromJson(v));
		});
	}
	if (json['ct_pois'] != null) {
		data.ctPois = new List<CinemaListCtPoi>();
		(json['ct_pois'] as List).forEach((v) {
			data.ctPois.add(new CinemaListCtPoi().fromJson(v));
		});
	}
	if (json['paging'] != null) {
		data.paging = new CinemaListPaging().fromJson(json['paging']);
	}
	if (json['resId'] != null) {
		data.resId = json['resId']?.toString();
	}
	return data;
}

Map<String, dynamic> cinemaListEntityToJson(CinemaListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.cinemas != null) {
		data['cinemas'] =  entity.cinemas.map((v) => v.toJson()).toList();
	}
	if (entity.ctPois != null) {
		data['ct_pois'] =  entity.ctPois.map((v) => v.toJson()).toList();
	}
	if (entity.paging != null) {
		data['paging'] = entity.paging.toJson();
	}
	data['resId'] = entity.resId;
	return data;
}

cinemaListCinemaFromJson(CinemaListCinema data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['mark'] != null) {
		data.mark = json['mark']?.toInt();
	}
	if (json['nm'] != null) {
		data.nm = json['nm']?.toString();
	}
	if (json['sellPrice'] != null) {
		data.sellPrice = json['sellPrice']?.toString();
	}
	if (json['addr'] != null) {
		data.addr = json['addr']?.toString();
	}
	if (json['distance'] != null) {
		data.distance = json['distance']?.toString();
	}
	if (json['tag'] != null) {
		data.tag = new CinemaListCinemasTag().fromJson(json['tag']);
	}
	if (json['promotion'] != null) {
		data.promotion = new CinemaListCinemasPromotion().fromJson(json['promotion']);
	}
	if (json['showTimes'] != null) {
		data.showTimes = json['showTimes']?.toString();
	}
	return data;
}

Map<String, dynamic> cinemaListCinemaToJson(CinemaListCinema entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['mark'] = entity.mark;
	data['nm'] = entity.nm;
	data['sellPrice'] = entity.sellPrice;
	data['addr'] = entity.addr;
	data['distance'] = entity.distance;
	if (entity.tag != null) {
		data['tag'] = entity.tag.toJson();
	}
	if (entity.promotion != null) {
		data['promotion'] = entity.promotion.toJson();
	}
	data['showTimes'] = entity.showTimes;
	return data;
}

cinemaListCinemasTagFromJson(CinemaListCinemasTag data, Map<String, dynamic> json) {
	if (json['allowRefund'] != null) {
		data.allowRefund = json['allowRefund']?.toInt();
	}
	if (json['buyout'] != null) {
		data.buyout = json['buyout']?.toInt();
	}
	if (json['cityCardTag'] != null) {
		data.cityCardTag = json['cityCardTag']?.toInt();
	}
	if (json['deal'] != null) {
		data.deal = json['deal']?.toInt();
	}
	if (json['endorse'] != null) {
		data.endorse = json['endorse']?.toInt();
	}
	if (json['giftTag'] != null) {
		data.giftTag = json['giftTag']?.toString();
	}
	if (json['hallType'] != null) {
		data.hallType = json['hallType']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['hallTypeVOList'] != null) {
		data.hallTypeVOList = new List<CinemaListCinemasTagHallTypeVOList>();
		(json['hallTypeVOList'] as List).forEach((v) {
			data.hallTypeVOList.add(new CinemaListCinemasTagHallTypeVOList().fromJson(v));
		});
	}
	if (json['sell'] != null) {
		data.sell = json['sell']?.toInt();
	}
	if (json['snack'] != null) {
		data.snack = json['snack']?.toInt();
	}
	if (json['vipTag'] != null) {
		data.vipTag = json['vipTag']?.toString();
	}
	return data;
}

Map<String, dynamic> cinemaListCinemasTagToJson(CinemaListCinemasTag entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['allowRefund'] = entity.allowRefund;
	data['buyout'] = entity.buyout;
	data['cityCardTag'] = entity.cityCardTag;
	data['deal'] = entity.deal;
	data['endorse'] = entity.endorse;
	data['giftTag'] = entity.giftTag;
	data['hallType'] = entity.hallType;
	if (entity.hallTypeVOList != null) {
		data['hallTypeVOList'] =  entity.hallTypeVOList.map((v) => v.toJson()).toList();
	}
	data['sell'] = entity.sell;
	data['snack'] = entity.snack;
	data['vipTag'] = entity.vipTag;
	return data;
}

cinemaListCinemasTagHallTypeVOListFromJson(CinemaListCinemasTagHallTypeVOList data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	return data;
}

Map<String, dynamic> cinemaListCinemasTagHallTypeVOListToJson(CinemaListCinemasTagHallTypeVOList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['url'] = entity.url;
	return data;
}

cinemaListCinemasPromotionFromJson(CinemaListCinemasPromotion data, Map<String, dynamic> json) {
	if (json['cardPromotionTag'] != null) {
		data.cardPromotionTag = json['cardPromotionTag']?.toString();
	}
	if (json['couponPromotionTag'] != null) {
		data.couponPromotionTag = json['couponPromotionTag']?.toString();
	}
	if (json['merchantActivityTag'] != null) {
		data.merchantActivityTag = json['merchantActivityTag']?.toString();
	}
	if (json['packShowActivityTag'] != null) {
		data.packShowActivityTag = json['packShowActivityTag']?.toString();
	}
	if (json['platformActivityTag'] != null) {
		data.platformActivityTag = json['platformActivityTag']?.toString();
	}
	if (json['starActivityTag'] != null) {
		data.starActivityTag = json['starActivityTag']?.toString();
	}
	return data;
}

Map<String, dynamic> cinemaListCinemasPromotionToJson(CinemaListCinemasPromotion entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['cardPromotionTag'] = entity.cardPromotionTag;
	data['couponPromotionTag'] = entity.couponPromotionTag;
	data['merchantActivityTag'] = entity.merchantActivityTag;
	data['packShowActivityTag'] = entity.packShowActivityTag;
	data['platformActivityTag'] = entity.platformActivityTag;
	data['starActivityTag'] = entity.starActivityTag;
	return data;
}

cinemaListCtPoiFromJson(CinemaListCtPoi data, Map<String, dynamic> json) {
	if (json['ct_poi'] != null) {
		data.ctPoi = json['ct_poi']?.toString();
	}
	if (json['poiid'] != null) {
		data.poiid = json['poiid']?.toInt();
	}
	return data;
}

Map<String, dynamic> cinemaListCtPoiToJson(CinemaListCtPoi entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ct_poi'] = entity.ctPoi;
	data['poiid'] = entity.poiid;
	return data;
}

cinemaListPagingFromJson(CinemaListPaging data, Map<String, dynamic> json) {
	if (json['hasMore'] != null) {
		data.hasMore = json['hasMore'];
	}
	if (json['limit'] != null) {
		data.limit = json['limit']?.toInt();
	}
	if (json['offset'] != null) {
		data.offset = json['offset']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	return data;
}

Map<String, dynamic> cinemaListPagingToJson(CinemaListPaging entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['hasMore'] = entity.hasMore;
	data['limit'] = entity.limit;
	data['offset'] = entity.offset;
	data['total'] = entity.total;
	return data;
}