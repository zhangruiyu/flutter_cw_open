class PayResultEntity {
  String msg;
  PayResultData data;
  int status;

  PayResultEntity({this.msg, this.data, this.status});

  PayResultEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data =
        json['data'] != null ? new PayResultData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class PayResultData {
  String totalFee;
  int status;

  PayResultData({this.totalFee, this.status});

  PayResultData.fromJson(Map<String, dynamic> json) {
    totalFee = json['total_fee'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_fee'] = this.totalFee;
    data['status'] = this.status;
    return data;
  }
}
