class TotalIntegralEntity {
  String msg;
  TotalIntegralData data;
  int status;

  TotalIntegralEntity({this.msg, this.data, this.status});

  TotalIntegralEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null
        ? new TotalIntegralData.fromJson(json['data'])
        : null;
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

class TotalIntegralData {
  int total;
  bool showRecharge;

  TotalIntegralData({this.total, this.showRecharge});

  TotalIntegralData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    showRecharge = json['showRecharge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['showRecharge'] = this.showRecharge;
    return data;
  }
}
