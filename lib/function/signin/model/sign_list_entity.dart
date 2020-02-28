class SignListEntity {
  String msg;
  SignListData data;
  int status;

  SignListEntity({this.msg, this.data, this.status});

  SignListEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data =
        json['data'] != null ? new SignListData.fromJson(json['data']) : null;
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

class SignListData {
  SignListDataSignlist signList;
  int totalIntegral;
  int multiple;

  SignListData({this.signList, this.totalIntegral, this.multiple});

  SignListData.fromJson(Map<String, dynamic> json) {
    signList = json['signList'] != null
        ? new SignListDataSignlist.fromJson(json['signList'])
        : null;
    totalIntegral = json['totalIntegral'];
    multiple = json['multiple'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.signList != null) {
      data['signList'] = this.signList.toJson();
    }
    data['totalIntegral'] = this.totalIntegral;
    data['multiple'] = this.multiple;
    return data;
  }
}

class SignListDataSignlist {
  int signCount;
  List<String> signTime;

  SignListDataSignlist({this.signCount, this.signTime});

  SignListDataSignlist.fromJson(Map<String, dynamic> json) {
    signCount = json['sign_count'];
    signTime = json['sign_time']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sign_count'] = this.signCount;
    data['sign_time'] = this.signTime;
    return data;
  }
}
