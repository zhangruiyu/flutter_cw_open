class LoginEntity {
  LoginData data;
  int status;

  LoginEntity({this.data, this.status});

  LoginEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class LoginData {
  String createTime;
  int userId;
  String nickName;
  int sex;
  String avatar;
  String description;
  String tel;
  String token;
  bool hasPet;

  LoginData(
      {this.createTime,
      this.userId,
      this.nickName,
      this.sex,
      this.description,
      this.avatar,
      this.tel,
      this.token,
      this.hasPet});

  LoginData.fromJson(Map<String, dynamic> json) {
    createTime = json['create_time'];
    userId = json['user_id'];
    nickName = json['nick_name'];
    sex = json['sex'];
    description = json['description'];
    avatar = json['avatar'];
    tel = json['tel'];
    token = json['token'];
    hasPet = json['has_pet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    data['user_id'] = this.userId;
    data['nick_name'] = this.nickName;
    data['sex'] = this.sex;
    data['description'] = this.description;
    data['tel'] = this.tel;
    data['avatar'] = this.avatar;
    data['token'] = this.token;
    data['has_pet'] = this.hasPet;
    return data;
  }
}
