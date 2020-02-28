class CurrentUserTallyEntity {
  String msg;
  List<CurrentUserTallyData> data;
  int status;

  CurrentUserTallyEntity({this.msg, this.data, this.status});

  CurrentUserTallyEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<CurrentUserTallyData>();
      (json['data'] as List).forEach((v) {
        data.add(new CurrentUserTallyData.fromJson(v));
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

class CurrentUserTallyData {
  String image;
  String takeDate;
  String createTime;
  int userId;
  String price;
  int id;
  List<int> taskTags;
  String remake;
  List<String> tagNames;

  CurrentUserTallyData(
      {this.image,
      this.takeDate,
      this.createTime,
      this.userId,
      this.price,
      this.id,
      this.taskTags,
      this.remake,
      this.tagNames});

  CurrentUserTallyData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    takeDate = json['take_date'];
    createTime = json['create_time'];
    userId = json['user_id'];
    price = json['price'];
    id = json['id'];
    taskTags = json['task_tags']?.cast<int>();
    remake = json['remake'];
    tagNames = json['tag_names']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['take_date'] = this.takeDate;
    data['create_time'] = this.createTime;
    data['user_id'] = this.userId;
    data['price'] = this.price;
    data['id'] = this.id;
    data['task_tags'] = this.taskTags;
    data['remake'] = this.remake;
    data['tag_names'] = this.tagNames;
    return data;
  }
}
