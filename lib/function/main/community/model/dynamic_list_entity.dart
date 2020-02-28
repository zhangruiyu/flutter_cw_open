class DynamicListEntity {
  String msg;
  List<DynamicListData> data;
  int status;

  DynamicListEntity({this.msg, this.data, this.status});

  DynamicListEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<DynamicListData>();
      (json['data'] as List).forEach((v) {
        data.add(new DynamicListData.fromJson(v));
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

class DynamicListData {
  List<Null> pets;
  List<String> images;
  String createTime;
  int userId;
  String nickName;
  int sex;
  String description;
  int id;
  DynamicListDataVideo video;
  String avatar;
  String content;
  List<int> liked;

  DynamicListData(
      {this.pets,
      this.images,
      this.createTime,
      this.userId,
      this.nickName,
      this.sex,
      this.description,
      this.id,
      this.video,
      this.avatar,
      this.content,
      this.liked});

  DynamicListData.fromJson(Map<String, dynamic> json) {
    if (json['pets'] != null) {
      pets = new List<Null>();
    }
    images = json['images']?.cast<String>();
    createTime = json['create_time'];
    userId = json['user_id'];
    nickName = json['nick_name'];
    sex = json['sex'];
    description = json['description'];
    id = json['id'];
    video = json['video'] != null
        ? new DynamicListDataVideo.fromJson(json['video'])
        : null;
    avatar = json['avatar'];
    content = json['content'];
    liked = json['liked']?.cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pets != null) {
      data['pets'] = [];
    }
    data['images'] = this.images;
    data['create_time'] = this.createTime;
    data['user_id'] = this.userId;
    data['nick_name'] = this.nickName;
    data['sex'] = this.sex;
    data['description'] = this.description;
    data['id'] = this.id;
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    data['avatar'] = this.avatar;
    data['content'] = this.content;
    data['liked'] = this.liked;
    return data;
  }

  @override
  String toString() {
    return 'DynamicListData{pets: $pets, images: $images, createTime: $createTime, userId: $userId, nickName: $nickName, sex: $sex, description: $description, id: $id, video: $video, avatar: $avatar, content: $content, liked: $liked}';
  }
}

class DynamicListDataVideo {
  String videoPath;
  String videoThumbnailPath;

  DynamicListDataVideo({this.videoPath, this.videoThumbnailPath});

  DynamicListDataVideo.fromJson(Map<String, dynamic> json) {
    videoPath = json['videoPath'];
    videoThumbnailPath = json['videoThumbnailPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoPath'] = this.videoPath;
    data['videoThumbnailPath'] = this.videoThumbnailPath;
    return data;
  }
}
