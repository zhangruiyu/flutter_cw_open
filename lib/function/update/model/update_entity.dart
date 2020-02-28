class UpdateEntity {
  String msg;
  UpdateData data;
  int status;

  UpdateEntity({this.msg, this.data, this.status});

  UpdateEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new UpdateData.fromJson(json['data']) : null;
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

class UpdateData {
  String downLoadUrl;
  bool needUpdate;
  String version;
  bool isForceUpdate;
  List<String> info;

  UpdateData(
      {this.downLoadUrl,
      this.needUpdate,
      this.version,
      this.isForceUpdate,
      this.info});

  UpdateData.fromJson(Map<String, dynamic> json) {
    downLoadUrl = json['downLoadUrl'];
    needUpdate = json['needUpdate'];
    version = json['version'];
    isForceUpdate = json['isForceUpdate'];
    info = json['info']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['downLoadUrl'] = this.downLoadUrl;
    data['needUpdate'] = this.needUpdate;
    data['version'] = this.version;
    data['isForceUpdate'] = this.isForceUpdate;
    data['info'] = this.info;
    return data;
  }
}
