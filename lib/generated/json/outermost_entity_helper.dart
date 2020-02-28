import 'package:chongmeng/network/entity/outermost_entity.dart';

outermostEntityFromJson(OutermostEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	return data;
}

Map<String, dynamic> outermostEntityToJson(OutermostEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	return data;
}