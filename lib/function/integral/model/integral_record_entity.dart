class IntegralRecordEntity {
  String msg;
  List<IntegralRecordData> data;
  int status;

  IntegralRecordEntity({this.msg, this.data, this.status});

  IntegralRecordEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<IntegralRecordData>();
      (json['data'] as List).forEach((v) {
        data.add(new IntegralRecordData.fromJson(v));
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

class IntegralRecordData {
  String createTime;
  int integral;
  String remake;

  IntegralRecordData({this.createTime, this.integral, this.remake});

  IntegralRecordData.fromJson(Map<String, dynamic> json) {
    createTime = json['create_time'];
    integral = json['integral'];
    remake = json['remake'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    data['integral'] = this.integral;
    data['remake'] = this.remake;
    return data;
  }
}
