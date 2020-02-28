class SafeEntity {
  String msg;
  SafeData data;
  int status;

  SafeEntity({this.msg, this.data, this.status});

  SafeEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new SafeData.fromJson(json['data']) : null;
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

class SafeData {
  bool isBindQq;
  bool isBindWechat;
  String tel;

  SafeData({this.isBindQq, this.isBindWechat, this.tel});

  SafeData.fromJson(Map<String, dynamic> json) {
    isBindQq = json['is_bind_qq'];
    isBindWechat = json['is_bind_wechat'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_bind_qq'] = this.isBindQq;
    data['is_bind_wechat'] = this.isBindWechat;
    data['tel'] = this.tel;
    return data;
  }
}
