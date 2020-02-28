class CinemaCityEntity {
  String msg;
  CinemaCityData data;
  int status;

  CinemaCityEntity({this.msg, this.data, this.status});

  CinemaCityEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data =
        json['data'] != null ? new CinemaCityData.fromJson(json['data']) : null;
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

class CinemaCityData {
  List<CinemaCityDataAllcity> allCity;
  List<CinemaCityDataAllcity> hotCity;

  CinemaCityData({this.allCity, this.hotCity});

  CinemaCityData.fromJson(Map<String, dynamic> json) {
    if (json['allCity'] != null) {
      allCity = new List<CinemaCityDataAllcity>();
      (json['allCity'] as List).forEach((v) {
        allCity.add(new CinemaCityDataAllcity.fromJson(v));
      });
    }
    if (json['hotCity'] != null) {
      hotCity = new List<CinemaCityDataAllcity>();
      (json['hotCity'] as List).forEach((v) {
        hotCity.add(new CinemaCityDataAllcity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allCity != null) {
      data['allCity'] = this.allCity.map((v) => v.toJson()).toList();
    }
    if (this.hotCity != null) {
      data['hotCity'] = this.hotCity.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CinemaCityDataAllcity {
  String name;
  int id;

  CinemaCityDataAllcity({this.name, this.id});

  CinemaCityDataAllcity.fromJson(Map<String, dynamic> json) {
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
