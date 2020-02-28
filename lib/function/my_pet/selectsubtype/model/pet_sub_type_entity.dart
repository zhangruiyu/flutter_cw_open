class PetSubTypeEntity {
  String msg;
  List<PetSubTypeData> data;
  int status;

  PetSubTypeEntity({this.msg, this.data, this.status});

  PetSubTypeEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<PetSubTypeData>();
      (json['data'] as List).forEach((v) {
        data.add(new PetSubTypeData.fromJson(v));
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

class PetSubTypeData {
  String image;
  String name;
  int id;

  PetSubTypeData({this.image, this.name, this.id});

  PetSubTypeData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
