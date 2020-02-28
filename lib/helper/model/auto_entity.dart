class AutoEntity {
  String msg;
  AutoData data;
  int status;

  AutoEntity({this.msg, this.data, this.status});

  AutoEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new AutoData.fromJson(json['data']) : null;
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

class AutoData {
  bool flag;
  String token;
  String phone;

  AutoData({this.flag, this.token, this.phone});

  AutoData.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    token = json['token'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['token'] = this.token;
    data['phone'] = this.phone;
    return data;
  }
}
