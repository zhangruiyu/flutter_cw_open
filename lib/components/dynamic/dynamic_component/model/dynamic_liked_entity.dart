class DynamicLikedEntity {
  String msg;
  DynamicLikedData data;
  int status;

  DynamicLikedEntity({this.msg, this.data, this.status});

  DynamicLikedEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null
        ? new DynamicLikedData.fromJson(json['data'])
        : null;
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

class DynamicLikedData {
  List<int> liked;

  DynamicLikedData({this.liked});

  DynamicLikedData.fromJson(Map<String, dynamic> json) {
    liked = json['liked']?.cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['liked'] = this.liked;
    return data;
  }
}
