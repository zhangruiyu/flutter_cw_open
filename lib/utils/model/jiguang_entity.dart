class JiguangEntity {
  String msg;
  JiguangData data;
  int status;

  JiguangEntity({this.msg, this.data, this.status});

  JiguangEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new JiguangData.fromJson(json['data']) : null;
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

class JiguangData {
  String password;
  String userName;

  JiguangData({this.password, this.userName});

  JiguangData.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['user_name'] = this.userName;
    return data;
  }
}
