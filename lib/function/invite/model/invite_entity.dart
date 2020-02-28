class InviteEntity {
  String msg;
  InviteData data;
  int status;

  InviteEntity({this.msg, this.data, this.status});

  InviteEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new InviteData.fromJson(json['data']) : null;
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

class InviteData {
  int totalInviteIntegral;
  String inviteUrl;
  List<InviteDataInviterecord> inviteRecord;

  InviteData({this.totalInviteIntegral, this.inviteRecord});

  InviteData.fromJson(Map<String, dynamic> json) {
    inviteUrl = json['inviteUrl'];
    totalInviteIntegral = json['totalInviteIntegral'];
    if (json['inviteRecord'] != null) {
      inviteRecord = new List<InviteDataInviterecord>();
      (json['inviteRecord'] as List).forEach((v) {
        inviteRecord.add(new InviteDataInviterecord.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inviteUrl'] = this.inviteUrl;
    data['totalInviteIntegral'] = this.totalInviteIntegral;
    if (this.inviteRecord != null) {
      data['inviteRecord'] = this.inviteRecord.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InviteDataInviterecord {
  int userId;
  String tel;
  int inviteStatus;

  InviteDataInviterecord({this.userId, this.tel, this.inviteStatus});

  InviteDataInviterecord.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    tel = json['tel'];
    inviteStatus = json['invite_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['tel'] = this.tel;
    data['invite_status'] = this.inviteStatus;
    return data;
  }
}
