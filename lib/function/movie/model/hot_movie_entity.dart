/*class HotMovieEntity {
  String msg;
  HotMovieData data;
  int status;

  HotMovieEntity({this.msg, this.data, this.status});

  HotMovieEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data =
        json['data'] != null ? new HotMovieData.fromJson(json['data']) : null;
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
}*/

class HotMovieEntity {
  int total;
  String stid;
  List<HotMovieDataMovielist> movieList;
  List<HotMovieDataStid> stids;
  List<Null> coming;
  List<int> movieIds;

  HotMovieEntity(
      {this.total,
      this.stid,
      this.movieList,
      this.stids,
      this.coming,
      this.movieIds});

  HotMovieEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    stid = json['stid'];
    if (json['movieList'] != null) {
      movieList = new List<HotMovieDataMovielist>();
      (json['movieList'] as List).forEach((v) {
        movieList.add(new HotMovieDataMovielist.fromJson(v));
      });
    }
    if (json['stids'] != null) {
      stids = new List<HotMovieDataStid>();
      (json['stids'] as List).forEach((v) {
        stids.add(new HotMovieDataStid.fromJson(v));
      });
    }
    if (json['coming'] != null) {
      coming = new List<Null>();
    }
    movieIds = json['movieIds']?.cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['stid'] = this.stid;
    if (this.movieList != null) {
      data['movieList'] = this.movieList.map((v) => v.toJson()).toList();
    }
    if (this.stids != null) {
      data['stids'] = this.stids.map((v) => v.toJson()).toList();
    }
    if (this.coming != null) {
      data['coming'] = [];
    }
    data['movieIds'] = this.movieIds;
    return data;
  }
}

class HotMovieDataMovielist {
  String img;
  String rt;
  String showInfo;
  String star;
  bool globalReleased;
  int wishst;
  String version;
  double sc;
  int wish;
  bool haspromotionTag;
  int showst;
  bool preShow;
  int id;
  String nm;

  HotMovieDataMovielist(
      {this.img,
      this.rt,
      this.showInfo,
      this.star,
      this.globalReleased,
      this.wishst,
      this.version,
      this.sc,
      this.wish,
      this.haspromotionTag,
      this.showst,
      this.preShow,
      this.id,
      this.nm});

  HotMovieDataMovielist.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    rt = json['rt'];
    showInfo = json['showInfo'];
    star = json['star'];
    globalReleased = json['globalReleased'];
    wishst = json['wishst'];
    version = json['version'];
    sc = double.parse(json['sc'].toString());
    wish = json['wish'];
    haspromotionTag = json['haspromotionTag'];
    showst = json['showst'];
    preShow = json['preShow'];
    id = json['id'];
    nm = json['nm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['rt'] = this.rt;
    data['showInfo'] = this.showInfo;
    data['star'] = this.star;
    data['globalReleased'] = this.globalReleased;
    data['wishst'] = this.wishst;
    data['version'] = this.version;
    data['sc'] = this.sc;
    data['wish'] = this.wish;
    data['haspromotionTag'] = this.haspromotionTag;
    data['showst'] = this.showst;
    data['preShow'] = this.preShow;
    data['id'] = this.id;
    data['nm'] = this.nm;
    return data;
  }
}

class HotMovieDataStid {
  int movieId;
  String stid;

  HotMovieDataStid({this.movieId, this.stid});

  HotMovieDataStid.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId'];
    stid = json['stid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movieId'] = this.movieId;
    data['stid'] = this.stid;
    return data;
  }
}
