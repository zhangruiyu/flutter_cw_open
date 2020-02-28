class ShareProductEntity {
  String msg;
  ShareProductData data;
  int status;

  ShareProductEntity({this.msg, this.data, this.status});

  ShareProductEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null
        ? new ShareProductData.fromJson(json['data'])
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

class ShareProductData {
  String youhuiquan;
  String clickUrl;
  String type;
  String tpwd;

  ShareProductData({this.youhuiquan, this.clickUrl, this.type, this.tpwd});

  ShareProductData.fromJson(Map<String, dynamic> json) {
    youhuiquan = json['youhuiquan'];
    clickUrl = json['click_url'];
    type = json['type'];
    tpwd = json['tpwd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['youhuiquan'] = this.youhuiquan;
    data['click_url'] = this.clickUrl;
    data['type'] = this.type;
    data['tpwd'] = this.tpwd;
    return data;
  }
}
