class CosEntity {
  String msg;
  CosData data;
  int status;

  CosEntity({this.msg, this.data, this.status});

  CosEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new CosData.fromJson(json['data']) : null;
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

class CosData {
  String tmpSecretId;
  String cosPath;
  String tmpSecretKey;
  String sessionToken;
  String region;
  String appid;
  String bucket;
  int expiredTime;

  CosData(
      {this.tmpSecretId,
      this.cosPath,
      this.tmpSecretKey,
      this.sessionToken,
      this.expiredTime});

  CosData.fromJson(Map<String, dynamic> json) {
    tmpSecretId = json['tmpSecretId'];
    cosPath = json['cosPath'];
    tmpSecretKey = json['tmpSecretKey'];
    sessionToken = json['sessionToken'];
    expiredTime = json['expiredTime'];
    region = json['region'];
    appid = json['appid'];
    bucket = json['bucket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tmpSecretId'] = this.tmpSecretId;
    data['cosPath'] = this.cosPath;
    data['tmpSecretKey'] = this.tmpSecretKey;
    data['sessionToken'] = this.sessionToken;
    data['expiredTime'] = this.expiredTime;
    data['region'] = this.region;
    data['appid'] = this.appid;
    data['bucket'] = this.bucket;
    return data;
  }
}
