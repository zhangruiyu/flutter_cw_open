class DetailsEntity {
  String msg;
  DetailsData data;
  int status;

  DetailsEntity({this.msg, this.data, this.status});

  DetailsEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new DetailsData.fromJson(json['data']) : null;
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

class DetailsData {
  DetailsDataStoreinfo storeInfo;
  List<String> pics;

  DetailsData({this.storeInfo, this.pics});

  DetailsData.fromJson(Map<String, dynamic> json) {
    storeInfo = json['storeInfo'] != null
        ? new DetailsDataStoreinfo.fromJson(json['storeInfo'])
        : null;
    pics = json['pics']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.storeInfo != null) {
      data['storeInfo'] = this.storeInfo.toJson();
    }
    data['pics'] = this.pics;
    return data;
  }
}

class DetailsDataStoreinfo {
  String nick;
  String taoShopUrl;
  String created;
  String picPath;
  String title;
  DetailsDataStoreinfoShopScore shopScore;
  String sid;

  DetailsDataStoreinfo(
      {this.nick,
      this.taoShopUrl,
      this.created,
      this.picPath,
      this.title,
      this.shopScore,
      this.sid});

  DetailsDataStoreinfo.fromJson(Map<String, dynamic> json) {
    nick = json['nick'];
    taoShopUrl = json['taoShopUrl'];
    created = json['created'];
    picPath = json['pic_path'];
    title = json['title'];
    shopScore = json['shop_score'] != null
        ? new DetailsDataStoreinfoShopScore.fromJson(json['shop_score'])
        : null;
    sid = json['sid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nick'] = this.nick;
    data['taoShopUrl'] = this.taoShopUrl;
    data['created'] = this.created;
    data['pic_path'] = this.picPath;
    data['title'] = this.title;
    if (this.shopScore != null) {
      data['shop_score'] = this.shopScore.toJson();
    }
    data['sid'] = this.sid;
    return data;
  }
}

class DetailsDataStoreinfoShopScore {
  String deliveryScore;
  String serviceScore;
  String itemScore;

  DetailsDataStoreinfoShopScore(
      {this.deliveryScore, this.serviceScore, this.itemScore});

  DetailsDataStoreinfoShopScore.fromJson(Map<String, dynamic> json) {
    deliveryScore = json['delivery_score'];
    serviceScore = json['service_score'];
    itemScore = json['item_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_score'] = this.deliveryScore;
    data['service_score'] = this.serviceScore;
    data['item_score'] = this.itemScore;
    return data;
  }
}
