class CommentEntity {
  String msg;
  List<CommentData> data;
  int status;

  CommentEntity({this.msg, this.data, this.status});

  CommentEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<CommentData>();
      (json['data'] as List).forEach((v) {
        data.add(new CommentData.fromJson(v));
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

class CommentData {
  String createTime;
  List<Null> atUserIds;
  int sex;
  String pic;
  String avatar;
  String content;
  List<Null> liked;
  int momentId;
  int replyId;
  int userId;
  dynamic toUserId;
  String nickName;
  int id;
  List<CommantDataReply> reply;

  CommentData(
      {this.createTime,
      this.atUserIds,
      this.sex,
      this.pic,
      this.avatar,
      this.content,
      this.liked,
      this.momentId,
      this.replyId,
      this.userId,
      this.toUserId,
      this.nickName,
      this.id,
      this.reply});

  CommentData.fromJson(Map<String, dynamic> json) {
    createTime = json['create_time'];
    if (json['at_user_ids'] != null) {
      atUserIds = new List<Null>();
    }
    sex = json['sex'];
    pic = json['pic'];
    avatar = json['avatar'];
    content = json['content'];
    if (json['liked'] != null) {
      liked = new List<Null>();
    }
    momentId = json['moment_id'];
    replyId = json['reply_id'];
    userId = json['user_id'];
    toUserId = json['to_user_id'];
    nickName = json['nick_name'];
    id = json['id'];
    if (json['reply'] != null) {
      reply = new List<CommantDataReply>();
      (json['reply'] as List).forEach((v) {
        reply.add(new CommantDataReply.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    if (this.atUserIds != null) {
      data['at_user_ids'] = [];
    }
    data['sex'] = this.sex;
    data['pic'] = this.pic;
    data['avatar'] = this.avatar;
    data['content'] = this.content;
    if (this.liked != null) {
      data['liked'] = [];
    }
    data['moment_id'] = this.momentId;
    data['reply_id'] = this.replyId;
    data['user_id'] = this.userId;
    data['to_user_id'] = this.toUserId;
    data['nick_name'] = this.nickName;
    data['id'] = this.id;
    if (this.reply != null) {
      data['reply'] = this.reply.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommantDataReply {
  String createTime;
  List<Null> atUserIds;
  int sex;
  dynamic pic;
  String avatar;
  String content;
  List<Null> liked;
  int momentId;
  int replyId;
  int userId;
  dynamic toUserId;
  String nickName;
  int id;

  CommantDataReply(
      {this.createTime,
      this.atUserIds,
      this.sex,
      this.pic,
      this.avatar,
      this.content,
      this.liked,
      this.momentId,
      this.replyId,
      this.userId,
      this.toUserId,
      this.nickName,
      this.id});

  CommantDataReply.fromJson(Map<String, dynamic> json) {
    createTime = json['create_time'];
    if (json['at_user_ids'] != null) {
      atUserIds = new List<Null>();
    }
    sex = json['sex'];
    pic = json['pic'];
    avatar = json['avatar'];
    content = json['content'];
    if (json['liked'] != null) {
      liked = new List<Null>();
    }
    momentId = json['moment_id'];
    replyId = json['reply_id'];
    userId = json['user_id'];
    toUserId = json['to_user_id'];
    nickName = json['nick_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    if (this.atUserIds != null) {
      data['at_user_ids'] = [];
    }
    data['sex'] = this.sex;
    data['pic'] = this.pic;
    data['avatar'] = this.avatar;
    data['content'] = this.content;
    if (this.liked != null) {
      data['liked'] = [];
    }
    data['moment_id'] = this.momentId;
    data['reply_id'] = this.replyId;
    data['user_id'] = this.userId;
    data['to_user_id'] = this.toUserId;
    data['nick_name'] = this.nickName;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'CommantDataReply{createTime: $createTime, atUserIds: $atUserIds, sex: $sex, pic: $pic, avatar: $avatar, content: $content, liked: $liked, momentId: $momentId, replyId: $replyId, userId: $userId, toUserId: $toUserId, nickName: $nickName, id: $id}';
  }
}
