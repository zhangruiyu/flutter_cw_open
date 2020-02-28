class AccountEntity {
  String msg;
  AccountData data;
  int status;

  AccountEntity({this.msg, this.data, this.status});

  AccountEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new AccountData.fromJson(json['data']) : null;
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

class AccountData {
  String nickName;
  int subscribersCount;
  String description;
  String avatar;
  int totalIntegral;
  int petCount;
  int fans;

  AccountData(
      {this.nickName,
      this.subscribersCount,
      this.description,
      this.avatar,
      this.totalIntegral,
      this.petCount,
      this.fans});

  AccountData.fromJson(Map<String, dynamic> json) {
    nickName = json['nickName'];
    subscribersCount = json['subscribers_count'];
    description = json['description'];
    avatar = json['avatar'];
    totalIntegral = json['totalIntegral'];
    petCount = json['petCount'];
    fans = json['fans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nickName'] = this.nickName;
    data['subscribers_count'] = this.subscribersCount;
    data['description'] = this.description;
    data['avatar'] = this.avatar;
    data['totalIntegral'] = this.totalIntegral;
    data['petCount'] = this.petCount;
    data['fans'] = this.fans;
    return data;
  }
}
