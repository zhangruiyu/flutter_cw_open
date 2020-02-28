class IntegralCommodityEntity {
  String msg;
  IntegralCommodityData data;
  int status;

  IntegralCommodityEntity({this.msg, this.data, this.status});

  IntegralCommodityEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null
        ? new IntegralCommodityData.fromJson(json['data'])
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

class IntegralCommodityData {
  IntegralCommodityDataElemo elemo;
  List<IntegralCommodityDataIntegralcommodity> integralCommodity;
  List<String> sysNotices;

  IntegralCommodityData({this.elemo, this.integralCommodity, this.sysNotices});

  IntegralCommodityData.fromJson(Map<String, dynamic> json) {
    elemo = json['elemo'] != null
        ? new IntegralCommodityDataElemo.fromJson(json['elemo'])
        : null;
    if (json['integralCommodity'] != null) {
      integralCommodity = new List<IntegralCommodityDataIntegralcommodity>();
      (json['integralCommodity'] as List).forEach((v) {
        integralCommodity
            .add(new IntegralCommodityDataIntegralcommodity.fromJson(v));
      });
    }
    sysNotices = json['sysNotices']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.elemo != null) {
      data['elemo'] = this.elemo.toJson();
    }
    if (this.integralCommodity != null) {
      data['integralCommodity'] =
          this.integralCommodity.map((v) => v.toJson()).toList();
    }
    data['sysNotices'] = this.sysNotices;
    return data;
  }
}

class IntegralCommodityDataIntegralcommodity {
  int integralPrice;
  String createTime;
  String name;
  int count;
  String details;
  String externalRemake;
  int id;
  List<String> pic;

  IntegralCommodityDataIntegralcommodity(
      {this.integralPrice,
      this.createTime,
      this.name,
      this.count,
      this.details,
      this.id,
      this.pic});

  IntegralCommodityDataIntegralcommodity.fromJson(Map<String, dynamic> json) {
    integralPrice = json['integral_price'];
    createTime = json['create_time'];
    name = json['name'];
    count = json['count'];
    details = json['details'];
    id = json['id'];
    externalRemake = json['external_remake'];
    pic = json['pic']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integral_price'] = this.integralPrice;
    data['create_time'] = this.createTime;
    data['name'] = this.name;
    data['count'] = this.count;
    data['details'] = this.details;
    data['id'] = this.id;
    data['pic'] = this.pic;
    data['external_remake'] = this.externalRemake;
    return data;
  }
}

class IntegralCommodityDataElemo {
  List<IntegralCommodityDataElemoType> types;
  String pic;
  String title;
  int integralPrice;

  IntegralCommodityDataElemo({this.types, this.pic, this.title});

  IntegralCommodityDataElemo.fromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = new List<IntegralCommodityDataElemoType>();
      (json['types'] as List).forEach((v) {
        types.add(new IntegralCommodityDataElemoType.fromJson(v));
      });
    }
    pic = json['pic'];
    title = json['title'];
    integralPrice = json['integral_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.types != null) {
      data['types'] = this.types.map((v) => v.toJson()).toList();
    }
    data['pic'] = this.pic;
    data['title'] = this.title;
    data['integral_price'] = this.integralPrice;
    return data;
  }
}

class IntegralCommodityDataElemoType {
  int integralPrice;
  String title;
  String type;
  String content;

  IntegralCommodityDataElemoType(
      {this.integralPrice, this.title, this.type, this.content});

  IntegralCommodityDataElemoType.fromJson(Map<String, dynamic> json) {
    integralPrice = json['integral_price'];
    title = json['title'];
    type = json['type'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integral_price'] = this.integralPrice;
    data['title'] = this.title;
    data['type'] = this.type;
    data['content'] = this.content;
    return data;
  }
}
