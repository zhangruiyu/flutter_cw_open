class TallyTagEntity {
  String msg;
  List<TallyTagData> data;
  int status;

  TallyTagEntity({this.msg, this.data, this.status});

  TallyTagEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<TallyTagData>();
      (json['data'] as List).forEach((v) {
        data.add(new TallyTagData.fromJson(v));
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

class TallyTagData {
  String name;
  int id;

  TallyTagData({this.name, this.id});

  TallyTagData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
