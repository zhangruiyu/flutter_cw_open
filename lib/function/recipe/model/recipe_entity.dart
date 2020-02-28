class RecipeEntity {
  String msg;
  List<RecipeData> data;
  int status;

  RecipeEntity({this.msg, this.data, this.status});

  RecipeEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<RecipeData>();
      (json['data'] as List).forEach((v) {
        data.add(new RecipeData.fromJson(v));
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

class RecipeData {
  List<RecipeDataData> data;
  String title;

  RecipeData({this.data, this.title});

  RecipeData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<RecipeDataData>();
      (json['data'] as List).forEach((v) {
        data.add(new RecipeDataData.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}

class RecipeDataData {
  String typeName;
  int bigStar;
  int subTypeId;
  int middleStar;
  String name;
  String description;
  int smallStar;
  int id;
  String pic;

  RecipeDataData(
      {this.typeName,
      this.bigStar,
      this.subTypeId,
      this.middleStar,
      this.name,
      this.description,
      this.smallStar,
      this.id,
      this.pic});

  RecipeDataData.fromJson(Map<String, dynamic> json) {
    typeName = json['type_name'];
    bigStar = json['big_star'];
    subTypeId = json['sub_type_id'];
    middleStar = json['middle_star'];
    name = json['name'];
    description = json['description'];
    smallStar = json['small_star'];
    id = json['id'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_name'] = this.typeName;
    data['big_star'] = this.bigStar;
    data['sub_type_id'] = this.subTypeId;
    data['middle_star'] = this.middleStar;
    data['name'] = this.name;
    data['description'] = this.description;
    data['small_star'] = this.smallStar;
    data['id'] = this.id;
    data['pic'] = this.pic;
    return data;
  }
}
