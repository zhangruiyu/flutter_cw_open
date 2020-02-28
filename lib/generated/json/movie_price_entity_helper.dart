import 'package:chongmeng/function/movie/movie_cinema/model/movie_price_entity.dart';

moviePriceEntityFromJson(MoviePriceEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new MoviePriceData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> moviePriceEntityToJson(MoviePriceEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

moviePriceDataFromJson(MoviePriceData data, Map<String, dynamic> json) {
	if (json['itemMoney'] != null) {
		data.itemMoney = json['itemMoney']?.toInt();
	}
	return data;
}

Map<String, dynamic> moviePriceDataToJson(MoviePriceData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['itemMoney'] = entity.itemMoney;
	return data;
}