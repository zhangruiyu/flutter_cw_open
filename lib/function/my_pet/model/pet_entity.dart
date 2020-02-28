class PetEntity {
  String msg;
  List<PetData> data;
  int status;

  PetEntity({this.msg, this.data, this.status});

  PetEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<PetData>();
      (json['data'] as List).forEach((v) {
        data.add(new PetData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class PetData {
  String nick;
  String birthday;
  String petTypeName;
  String sex;
  int petTypeId;
  String avatar;
  int petSubTypeId;
  String status;

  PetData(
      {this.nick,
      this.birthday,
      this.petTypeName,
      this.sex,
      this.petTypeId,
      this.avatar,
      this.petSubTypeId,
      this.status});

  PetData.fromJson(Map<String, dynamic> json) {
    nick = json['nick'];
    birthday = json['birthday'];
    petTypeName = json['petTypeName'];
    sex = json['sex'];
    petTypeId = json['petTypeId'];
    avatar = json['avatar'];
    petSubTypeId = json['petSubTypeId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nick'] = this.nick;
    data['birthday'] = this.birthday;
    data['petTypeName'] = this.petTypeName;
    data['sex'] = this.sex;
    data['petTypeId'] = this.petTypeId;
    data['avatar'] = this.avatar;
    data['petSubTypeId'] = this.petSubTypeId;
    data['status'] = this.status;
    return data;
  }
}
