class MovieScheduleEntity {
  List<MovieScheduleCinema> cinemas;
  int random;
  String movieId;
  MovieSchedulePaging paging;
  String day;

  MovieScheduleEntity(
      {this.cinemas, this.random, this.movieId, this.paging, this.day});

  MovieScheduleEntity.fromJson(Map<String, dynamic> json) {
    if (json['cinemas'] != null) {
      cinemas = new List<MovieScheduleCinema>();
      (json['cinemas'] as List).forEach((v) {
        cinemas.add(new MovieScheduleCinema.fromJson(v));
      });
    }
    random = json['random'];
    movieId = json['movieId'];
    paging = json['paging'] != null
        ? new MovieSchedulePaging.fromJson(json['paging'])
        : null;
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cinemas != null) {
      data['cinemas'] = this.cinemas.map((v) => v.toJson()).toList();
    }
    data['random'] = this.random;
    data['movieId'] = this.movieId;
    if (this.paging != null) {
      data['paging'] = this.paging.toJson();
    }
    data['day'] = this.day;
    return data;
  }
}

class MovieScheduleCinema {
  String distance;
  String showTimes;
  String sellPrice;
  int id;
  MovieScheduleCinemasTag tag;
  String addr;
  int mark;
  String nm;
  MovieScheduleCinemasPromotion promotion;

  MovieScheduleCinema(
      {this.distance,
      this.showTimes,
      this.sellPrice,
      this.id,
      this.tag,
      this.addr,
      this.mark,
      this.nm,
      this.promotion});

  MovieScheduleCinema.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    showTimes = json['showTimes'];
    sellPrice = json['sellPrice'];
    id = json['id'];
    tag = json['tag'] != null
        ? new MovieScheduleCinemasTag.fromJson(json['tag'])
        : null;
    addr = json['addr'];
    mark = json['mark'];
    nm = json['nm'];
    promotion = json['promotion'] != null
        ? new MovieScheduleCinemasPromotion.fromJson(json['promotion'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['distance'] = this.distance;
    data['showTimes'] = this.showTimes;
    data['sellPrice'] = this.sellPrice;
    data['id'] = this.id;
    if (this.tag != null) {
      data['tag'] = this.tag.toJson();
    }
    data['addr'] = this.addr;
    data['mark'] = this.mark;
    data['nm'] = this.nm;
    if (this.promotion != null) {
      data['promotion'] = this.promotion.toJson();
    }
    return data;
  }
}

class MovieScheduleCinemasTag {
  int cityCardTag;
  int deal;
  int allowRefund;
  int snack;
  int sell;
  List<String> hallType;
  int buyout;
  int endorse;
  List<MovieScheduleCinemasTagHalltypevolist> hallTypeVOList;

  MovieScheduleCinemasTag(
      {this.cityCardTag,
      this.deal,
      this.allowRefund,
      this.snack,
      this.sell,
      this.hallType,
      this.buyout,
      this.endorse,
      this.hallTypeVOList});

  MovieScheduleCinemasTag.fromJson(Map<String, dynamic> json) {
    cityCardTag = json['cityCardTag'];
    deal = json['deal'];
    allowRefund = json['allowRefund'];
    snack = json['snack'];
    sell = json['sell'];
    hallType = json['hallType']?.cast<String>();
    buyout = json['buyout'];
    endorse = json['endorse'];
    if (json['hallTypeVOList'] != null) {
      hallTypeVOList = new List<MovieScheduleCinemasTagHalltypevolist>();
      (json['hallTypeVOList'] as List).forEach((v) {
        hallTypeVOList
            .add(new MovieScheduleCinemasTagHalltypevolist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityCardTag'] = this.cityCardTag;
    data['deal'] = this.deal;
    data['allowRefund'] = this.allowRefund;
    data['snack'] = this.snack;
    data['sell'] = this.sell;
    data['hallType'] = this.hallType;
    data['buyout'] = this.buyout;
    data['endorse'] = this.endorse;
    if (this.hallTypeVOList != null) {
      data['hallTypeVOList'] =
          this.hallTypeVOList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieScheduleCinemasTagHalltypevolist {
  String name;
  String url;

  MovieScheduleCinemasTagHalltypevolist({this.name, this.url});

  MovieScheduleCinemasTagHalltypevolist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class MovieScheduleCinemasPromotion {
  MovieScheduleCinemasPromotion();

  MovieScheduleCinemasPromotion.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class MovieSchedulePaging {
  int total;
  int offset;
  bool hasMore;
  int limit;

  MovieSchedulePaging({this.total, this.offset, this.hasMore, this.limit});

  MovieSchedulePaging.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    offset = json['offset'];
    hasMore = json['hasMore'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['offset'] = this.offset;
    data['hasMore'] = this.hasMore;
    data['limit'] = this.limit;
    return data;
  }
}
