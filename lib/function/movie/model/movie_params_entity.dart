class MovieParamsEntity {
  String msg;
  MovieParamsData data;
  int status;

  MovieParamsEntity({this.msg, this.data, this.status});

  MovieParamsEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null
        ? new MovieParamsData.fromJson(json['data'])
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

class MovieParamsData {
  Map<String, dynamic> headers;
  Map<String, dynamic> params;
  bool isPost;
  String url;

  MovieParamsData({this.headers, this.params, this.isPost});

  MovieParamsData.fromJson(Map<String, dynamic> json) {
    headers = json['headers'];
    params = json['params'];
    isPost = json['isPost'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.headers != null) {
      data['headers'] = this.headers;
    }
    if (this.params != null) {
      data['params'] = this.params;
    }
    data['isPost'] = this.isPost;
    data['url'] = this.url;
    return data;
  }
}
