class LocalUser {
  int userId;
  String nickName;
  int sex;
  String description;
  String avatar;
  String token;

  LocalUser({
    this.userId,
    this.nickName,
    this.sex,
    this.description,
    this.avatar,
    this.token,
  });

  LocalUser.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    nickName = json['nick_name'];
    sex = json['sex'];
    avatar = json['avatar'];
    description = json['description'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['nick_name'] = this.nickName;
    data['sex'] = this.sex;
    data['description'] = this.description;
    data['token'] = this.token;
    data['avatar'] = this.avatar;
    return data;
  }

  LocalUser copyWith({
    int userId,
    String nickName,
    int sex,
    String description,
    String city,
    String avatar,
    String token,
  }) {
    return LocalUser(
      userId: userId ?? this.userId,
      nickName: nickName ?? this.nickName,
      sex: sex ?? this.sex,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      token: token ?? this.token,
    );
  }

  LocalUser merge(LocalUser other) {
    if (other == null) return this;

    return copyWith(
      userId: other.userId ?? userId,
      nickName: other.nickName ?? nickName,
      sex: other.sex ?? sex,
      description: other.description ?? description,
      avatar: other.avatar ?? avatar,
      token: other.token ?? token,
    );
  }

  @override
  String toString() {
    return 'LocalUser{ userId: $userId, nickName: $nickName, sex: $sex, description: $description, avatar: $avatar,  token: $token}';
  }
}
