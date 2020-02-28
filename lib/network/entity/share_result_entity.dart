class ShareResultEntity {
  String msg;
  ShareResultData data;
  int status;

  ShareResultEntity({this.msg, this.data, this.status});

  ShareResultEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null
        ? new ShareResultData.fromJson(json['data'])
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

class ShareResultData {
  int value;

  ShareResultData({this.value});

  ShareResultData.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    return data;
  }
}
