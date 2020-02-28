class SignInResultEntity {
  String msg;
  SignInResultData data;
  int status;

  SignInResultEntity({this.msg, this.data, this.status});

  SignInResultEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null
        ? new SignInResultData.fromJson(json['data'])
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

class SignInResultData {
  int addIntegral;
  int continuousSignCount;

  SignInResultData({this.addIntegral, this.continuousSignCount});

  SignInResultData.fromJson(Map<String, dynamic> json) {
    addIntegral = json['addIntegral'];
    continuousSignCount = json['continuousSignCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addIntegral'] = this.addIntegral;
    data['continuousSignCount'] = this.continuousSignCount;
    return data;
  }
}
