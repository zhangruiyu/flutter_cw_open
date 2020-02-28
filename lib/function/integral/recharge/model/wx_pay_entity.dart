class WxPayEntity {
  String msg;
  WxPayData data;
  int status;

  WxPayEntity({this.msg, this.data, this.status});

  WxPayEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new WxPayData.fromJson(json['data']) : null;
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

class WxPayData {
  String package;
  String appid;
  String sign;
  String partnerid;
  String prepayid;
  String noncestr;
  String orderId;
  int timestamp;

  WxPayData(
      {this.package,
      this.appid,
      this.sign,
      this.partnerid,
      this.prepayid,
      this.noncestr,
      this.orderId,
      this.timestamp});

  WxPayData.fromJson(Map<String, dynamic> json) {
    package = json['package'];
    appid = json['appid'];
    sign = json['sign'];
    partnerid = json['partnerid'];
    prepayid = json['prepayid'];
    noncestr = json['noncestr'];
    timestamp = json['timestamp'];
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package'] = this.package;
    data['appid'] = this.appid;
    data['sign'] = this.sign;
    data['partnerid'] = this.partnerid;
    data['prepayid'] = this.prepayid;
    data['noncestr'] = this.noncestr;
    data['timestamp'] = this.timestamp;
    data['orderId'] = this.orderId;
    return data;
  }
}
