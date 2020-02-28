class RechargeCommodityEntity {
  String msg;
  List<RechargeCommodityData> data;
  int status;

  RechargeCommodityEntity({this.msg, this.data, this.status});

  RechargeCommodityEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<RechargeCommodityData>();
      (json['data'] as List).forEach((v) {
        data.add(new RechargeCommodityData.fromJson(v));
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

class RechargeCommodityData {
  String showMoney;
  String createTime;

  RechargeCommodityData({this.createTime});

  RechargeCommodityData.fromJson(Map<String, dynamic> json) {
    createTime = json['create_time'];
    showMoney = json['showMoney'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    data['showMoney'] = this.showMoney;
    return data;
  }
}
