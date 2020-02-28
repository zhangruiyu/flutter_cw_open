import 'package:chongmeng/function/movie/model/search_cinema_entity.dart';

searchCinemaEntityFromJson(SearchCinemaEntity data, Map<String, dynamic> json) {
	if (json['cinemas'] != null) {
		data.cinemas = new SearchCinemaCinemas().fromJson(json['cinemas']);
	}
	return data;
}

Map<String, dynamic> searchCinemaEntityToJson(SearchCinemaEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.cinemas != null) {
		data['cinemas'] = entity.cinemas.toJson();
	}
	return data;
}

searchCinemaCinemasFromJson(SearchCinemaCinemas data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<SearchCinemaCinemasList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new SearchCinemaCinemasList().fromJson(v));
		});
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	return data;
}

Map<String, dynamic> searchCinemaCinemasToJson(SearchCinemaCinemas entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	data['total'] = entity.total;
	data['type'] = entity.type;
	return data;
}

searchCinemaCinemasListFromJson(SearchCinemaCinemasList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['nm'] != null) {
		data.nm = json['nm']?.toString();
	}
	if (json['sellPrice'] != null) {
		data.sellPrice = json['sellPrice']?.toString();
	}
	if (json['referencePrice'] != null) {
		data.referencePrice = json['referencePrice']?.toString();
	}
	if (json['addr'] != null) {
		data.addr = json['addr']?.toString();
	}
	if (json['sell'] != null) {
		data.sell = json['sell'];
	}
	if (json['deal'] != null) {
		data.deal = json['deal']?.toInt();
	}
	if (json['hallType'] != null) {
		data.hallType = json['hallType']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['allowRefund'] != null) {
		data.allowRefund = json['allowRefund']?.toInt();
	}
	if (json['endorse'] != null) {
		data.endorse = json['endorse']?.toInt();
	}
	if (json['snack'] != null) {
		data.snack = json['snack']?.toInt();
	}
	if (json['vipDesc'] != null) {
		data.vipDesc = json['vipDesc']?.toString();
	}
	if (json['distance'] != null) {
		data.distance = json['distance']?.toString();
	}
	return data;
}

Map<String, dynamic> searchCinemaCinemasListToJson(SearchCinemaCinemasList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['nm'] = entity.nm;
	data['sellPrice'] = entity.sellPrice;
	data['referencePrice'] = entity.referencePrice;
	data['addr'] = entity.addr;
	data['sell'] = entity.sell;
	data['deal'] = entity.deal;
	data['hallType'] = entity.hallType;
	data['allowRefund'] = entity.allowRefund;
	data['endorse'] = entity.endorse;
	data['snack'] = entity.snack;
	data['vipDesc'] = entity.vipDesc;
	data['distance'] = entity.distance;
	return data;
}