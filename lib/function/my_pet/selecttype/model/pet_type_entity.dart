class PetTypeEntity {
  String msg;
  List<PetTypeData> data;
  int status;

  PetTypeEntity({this.msg, this.data, this.status});

  PetTypeEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<PetTypeData>();
      (json['data'] as List).forEach((v) {
        data.add(new PetTypeData.fromJson(v));
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

class PetTypeData {
  String image;
  String name;
  int id;

  PetTypeData({this.image, this.name, this.id});

  PetTypeData.fromJson(Map<String, dynamic> json) {
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
