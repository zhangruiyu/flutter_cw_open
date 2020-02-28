import 'package:chongmeng/function/main/home/model/ali_product_item.dart';

class SearchResultEntity {
  String msg;
  List<AliProductItem> data;
  int status;

  SearchResultEntity({this.msg, this.data, this.status});

  SearchResultEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<AliProductItem>();
      (json['data'] as List).forEach((v) {
        data.add(new AliProductItem.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
