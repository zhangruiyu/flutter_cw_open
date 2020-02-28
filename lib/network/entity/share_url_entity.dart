class ShareUrlEntity {
  String msg;
  ShareUrlData data;
  int status;

  ShareUrlEntity({this.msg, this.data, this.status});

  ShareUrlEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data =
        json['data'] != null ? new ShareUrlData.fromJson(json['data']) : null;
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

class ShareUrlData {
  String inviteUrl;

  ShareUrlData({this.inviteUrl});

  ShareUrlData.fromJson(Map<String, dynamic> json) {
    inviteUrl = json['invite_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invite_url'] = this.inviteUrl;
    return data;
  }
}
