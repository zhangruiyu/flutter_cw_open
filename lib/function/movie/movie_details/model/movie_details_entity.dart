class MovieDetailsEntity {
  MovieDetailsData data;

  MovieDetailsEntity({this.data});

  MovieDetailsEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new MovieDetailsData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class MovieDetailsData {
  MovieDetailsDetailmovie detailMovie;

  MovieDetailsData({this.detailMovie});

  MovieDetailsData.fromJson(Map<String, dynamic> json) {
    detailMovie = json['detailMovie'] != null
        ? new MovieDetailsDetailmovie.fromJson(json['detailMovie'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detailMovie != null) {
      data['detailMovie'] = this.detailMovie.toJson();
    }
    return data;
  }
}

class MovieDetailsDetailmovie {
  String awardUrl;
  int dur;
  bool egg;
  String albumImg;
  int snum;
  String dir;
  int type;
  List<String> photos;
  int wish;
  String dra;
  bool comScorePersona;
  bool preScorePersona;
  int bingeWatchst;
  int id;
  String scm;
  int vodFreeSt;
  int episodes;
  String ver;
  String version;
  List<MovieDetailsDetailmovieDistribution> distributions;
  String vd;
  bool vodPlay;
  bool onlinePlay;
  int availableEpisodes;
  int watched;
  String oriLang;
  int showst;
  String videourl;
  int proScoreNum;
  int vodSt;
  String nm;
  String img;
  String rt;
  int movieType;
  int orderSt;
  bool globalReleased;
  int wishst;
  String pubDesc;
  int bingeWatch;
  int episodeDur;
  int viewedSt;
  dynamic sc;
  int proScore;
  String scoreLabel;
  bool modcsSt;
  int latestEpisode;
  String videoName;
  String cat;
  String musicStar;
  bool onSale;
  bool commented;
  String backgroundColor;
  String star;
  String enm;
  String src;
  int vnum;
  String videoImg;
  int musicNum;
  String musicName;
  bool multiPub;
  int pn;

  MovieDetailsDetailmovie(
      {this.awardUrl,
      this.dur,
      this.egg,
      this.albumImg,
      this.snum,
      this.dir,
      this.type,
      this.photos,
      this.wish,
      this.dra,
      this.comScorePersona,
      this.preScorePersona,
      this.bingeWatchst,
      this.id,
      this.scm,
      this.vodFreeSt,
      this.episodes,
      this.ver,
      this.version,
      this.distributions,
      this.vd,
      this.vodPlay,
      this.onlinePlay,
      this.availableEpisodes,
      this.watched,
      this.oriLang,
      this.showst,
      this.videourl,
      this.proScoreNum,
      this.vodSt,
      this.nm,
      this.img,
      this.rt,
      this.movieType,
      this.orderSt,
      this.globalReleased,
      this.wishst,
      this.pubDesc,
      this.bingeWatch,
      this.episodeDur,
      this.viewedSt,
      this.sc,
      this.proScore,
      this.scoreLabel,
      this.modcsSt,
      this.latestEpisode,
      this.videoName,
      this.cat,
      this.musicStar,
      this.onSale,
      this.commented,
      this.backgroundColor,
      this.star,
      this.enm,
      this.src,
      this.vnum,
      this.videoImg,
      this.musicNum,
      this.musicName,
      this.multiPub,
      this.pn});

  MovieDetailsDetailmovie.fromJson(Map<String, dynamic> json) {
    awardUrl = json['awardUrl'];
    dur = json['dur'];
    egg = json['egg'];
    albumImg = json['albumImg'];
    snum = json['snum'];
    dir = json['dir'];
    type = json['type'];
    photos = json['photos']?.cast<String>();
    wish = json['wish'];
    dra = json['dra'];
    comScorePersona = json['comScorePersona'];
    preScorePersona = json['preScorePersona'];
    bingeWatchst = json['bingeWatchst'];
    id = json['id'];
    scm = json['scm'];
    vodFreeSt = json['vodFreeSt'];
    episodes = json['episodes'];
    ver = json['ver'];
    version = json['version'];
    if (json['distributions'] != null) {
      distributions = new List<MovieDetailsDetailmovieDistribution>();
      (json['distributions'] as List).forEach((v) {
        distributions.add(new MovieDetailsDetailmovieDistribution.fromJson(v));
      });
    }
    vd = json['vd'];
    vodPlay = json['vodPlay'];
    onlinePlay = json['onlinePlay'];
    availableEpisodes = json['availableEpisodes'];
    watched = json['watched'];
    oriLang = json['oriLang'];
    showst = json['showst'];
    videourl = json['videourl'];
    proScoreNum = json['proScoreNum'];
    vodSt = json['vodSt'];
    nm = json['nm'];
    img = json['img'];
    rt = json['rt'];
    movieType = json['movieType'];
    orderSt = json['orderSt'];
    globalReleased = json['globalReleased'];
    wishst = json['wishst'];
    pubDesc = json['pubDesc'];
    bingeWatch = json['bingeWatch'];
    episodeDur = json['episodeDur'];
    viewedSt = json['viewedSt'];
    sc = json['sc'];
    proScore = json['proScore'];
    scoreLabel = json['scoreLabel'];
    modcsSt = json['modcsSt'];
    latestEpisode = json['latestEpisode'];
    videoName = json['videoName'];
    cat = json['cat'];
    musicStar = json['musicStar'];
    onSale = json['onSale'];
    commented = json['commented'];
    backgroundColor = json['backgroundColor'];
    star = json['star'];
    enm = json['enm'];
    src = json['src'];
    vnum = json['vnum'];
    videoImg = json['videoImg'];
    musicNum = json['musicNum'];
    musicName = json['musicName'];
    multiPub = json['multiPub'];
    pn = json['pn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['awardUrl'] = this.awardUrl;
    data['dur'] = this.dur;
    data['egg'] = this.egg;
    data['albumImg'] = this.albumImg;
    data['snum'] = this.snum;
    data['dir'] = this.dir;
    data['type'] = this.type;
    data['photos'] = this.photos;
    data['wish'] = this.wish;
    data['dra'] = this.dra;
    data['comScorePersona'] = this.comScorePersona;
    data['preScorePersona'] = this.preScorePersona;
    data['bingeWatchst'] = this.bingeWatchst;
    data['id'] = this.id;
    data['scm'] = this.scm;
    data['vodFreeSt'] = this.vodFreeSt;
    data['episodes'] = this.episodes;
    data['ver'] = this.ver;
    data['version'] = this.version;
    if (this.distributions != null) {
      data['distributions'] =
          this.distributions.map((v) => v.toJson()).toList();
    }
    data['vd'] = this.vd;
    data['vodPlay'] = this.vodPlay;
    data['onlinePlay'] = this.onlinePlay;
    data['availableEpisodes'] = this.availableEpisodes;
    data['watched'] = this.watched;
    data['oriLang'] = this.oriLang;
    data['showst'] = this.showst;
    data['videourl'] = this.videourl;
    data['proScoreNum'] = this.proScoreNum;
    data['vodSt'] = this.vodSt;
    data['nm'] = this.nm;
    data['img'] = this.img;
    data['rt'] = this.rt;
    data['movieType'] = this.movieType;
    data['orderSt'] = this.orderSt;
    data['globalReleased'] = this.globalReleased;
    data['wishst'] = this.wishst;
    data['pubDesc'] = this.pubDesc;
    data['bingeWatch'] = this.bingeWatch;
    data['episodeDur'] = this.episodeDur;
    data['viewedSt'] = this.viewedSt;
    data['sc'] = this.sc;
    data['proScore'] = this.proScore;
    data['scoreLabel'] = this.scoreLabel;
    data['modcsSt'] = this.modcsSt;
    data['latestEpisode'] = this.latestEpisode;
    data['videoName'] = this.videoName;
    data['cat'] = this.cat;
    data['musicStar'] = this.musicStar;
    data['onSale'] = this.onSale;
    data['commented'] = this.commented;
    data['backgroundColor'] = this.backgroundColor;
    data['star'] = this.star;
    data['enm'] = this.enm;
    data['src'] = this.src;
    data['vnum'] = this.vnum;
    data['videoImg'] = this.videoImg;
    data['musicNum'] = this.musicNum;
    data['musicName'] = this.musicName;
    data['multiPub'] = this.multiPub;
    data['pn'] = this.pn;
    return data;
  }
}

class MovieDetailsDetailmovieDistribution {
  String proportion;
  String movieScoreLevel;

  MovieDetailsDetailmovieDistribution({this.proportion, this.movieScoreLevel});

  MovieDetailsDetailmovieDistribution.fromJson(Map<String, dynamic> json) {
    proportion = json['proportion'];
    movieScoreLevel = json['movieScoreLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proportion'] = this.proportion;
    data['movieScoreLevel'] = this.movieScoreLevel;
    return data;
  }
}
