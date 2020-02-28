class CouponEntity {
  String msg;
  List<CouponData> data;
  int status;

  CouponEntity({this.msg, this.data, this.status});

  CouponEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<CouponData>();
      (json['data'] as List).forEach((v) {
        data.add(new CouponData.fromJson(v));
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

class CouponData {
  String amount;
  String threshold;
  String title;

  CouponData({this.amount, this.threshold, this.title});

  CouponData.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    threshold = json['threshold'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['threshold'] = this.threshold;
    data['title'] = this.title;
    return data;
  }
}
