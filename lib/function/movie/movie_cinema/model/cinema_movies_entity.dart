class CinemaMoviesEntity {
  CinemaMoviesShowdata showData;
  String cinemaId;
  int movieIndex;
  CinemaMoviesCinemadata cinemaData;
  CinemaMoviesDeallist dealList;
  int channelId;
  CinemaMoviesStone stone;

  CinemaMoviesEntity(
      {this.showData,
      this.cinemaId,
      this.movieIndex,
      this.cinemaData,
      this.dealList,
      this.channelId,
      this.stone});

  CinemaMoviesEntity.fromJson(Map<String, dynamic> json) {
    showData = json['showData'] != null
        ? new CinemaMoviesShowdata.fromJson(json['showData'])
        : null;
    cinemaId = json['cinemaId'];
    movieIndex = json['movieIndex'];
    cinemaData = json['cinemaData'] != null
        ? new CinemaMoviesCinemadata.fromJson(json['cinemaData'])
        : null;
    dealList = json['dealList'] != null
        ? new CinemaMoviesDeallist.fromJson(json['dealList'])
        : null;
    channelId = json['channelId'];
    stone = json['stone'] != null
        ? new CinemaMoviesStone.fromJson(json['stone'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.showData != null) {
      data['showData'] = this.showData.toJson();
    }
    data['cinemaId'] = this.cinemaId;
    data['movieIndex'] = this.movieIndex;
    if (this.cinemaData != null) {
      data['cinemaData'] = this.cinemaData.toJson();
    }
    if (this.dealList != null) {
      data['dealList'] = this.dealList.toJson();
    }
    data['channelId'] = this.channelId;
    if (this.stone != null) {
      data['stone'] = this.stone.toJson();
    }
    return data;
  }
}

class CinemaMoviesShowdata {
  List<CinemaMoviesShowdataMovie> movies;
  List<CinemaMoviesShowdataVipinfo> vipInfo;
  int modeSwitchThreshold;
  int cinemaId;
  String cinemaName;
  bool sell;
  int poiId;
  List<Null> cityCardInfo;
  int selectedMovieSeq;

  CinemaMoviesShowdata(
      {this.movies,
      this.vipInfo,
      this.modeSwitchThreshold,
      this.cinemaId,
      this.cinemaName,
      this.sell,
      this.poiId,
      this.cityCardInfo,
      this.selectedMovieSeq});

  CinemaMoviesShowdata.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = new List<CinemaMoviesShowdataMovie>();
      (json['movies'] as List).forEach((v) {
        movies.add(new CinemaMoviesShowdataMovie.fromJson(v));
      });
    }
    if (json['vipInfo'] != null) {
      vipInfo = new List<CinemaMoviesShowdataVipinfo>();
      (json['vipInfo'] as List).forEach((v) {
        vipInfo.add(new CinemaMoviesShowdataVipinfo.fromJson(v));
      });
    }
    modeSwitchThreshold = json['modeSwitchThreshold'];
    cinemaId = json['cinemaId'];
    cinemaName = json['cinemaName'];
    sell = json['sell'];
    poiId = json['poiId'];
    if (json['cityCardInfo'] != null) {
      cityCardInfo = new List<Null>();
    }
    selectedMovieSeq = json['selectedMovieSeq'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['movies'] = this.movies.map((v) => v.toJson()).toList();
    }
    if (this.vipInfo != null) {
      data['vipInfo'] = this.vipInfo.map((v) => v.toJson()).toList();
    }
    data['modeSwitchThreshold'] = this.modeSwitchThreshold;
    data['cinemaId'] = this.cinemaId;
    data['cinemaName'] = this.cinemaName;
    data['sell'] = this.sell;
    data['poiId'] = this.poiId;
    if (this.cityCardInfo != null) {
      data['cityCardInfo'] = [];
    }
    data['selectedMovieSeq'] = this.selectedMovieSeq;
    return data;
  }
}

class CinemaMoviesShowdataMovie {
  int dur;
  String sc;
  int wish;
  int preferential;
  String img;
  int showCount;
  List<CinemaMoviesShowdataMoviesShow> shows;
  bool globalReleased;
  int id;
  String desc;
  String nm;

  CinemaMoviesShowdataMovie(
      {this.dur,
      this.sc,
      this.wish,
      this.preferential,
      this.img,
      this.showCount,
      this.shows,
      this.globalReleased,
      this.id,
      this.desc,
      this.nm});

  CinemaMoviesShowdataMovie.fromJson(Map<String, dynamic> json) {
    dur = json['dur'];
    sc = json['sc'];
    wish = json['wish'];
    preferential = json['preferential'];
    img = json['img'];
    showCount = json['showCount'];
    if (json['shows'] != null) {
      shows = new List<CinemaMoviesShowdataMoviesShow>();
      (json['shows'] as List).forEach((v) {
        shows.add(new CinemaMoviesShowdataMoviesShow.fromJson(v));
      });
    }
    globalReleased = json['globalReleased'];
    id = json['id'];
    desc = json['desc'];
    nm = json['nm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dur'] = this.dur;
    data['sc'] = this.sc;
    data['wish'] = this.wish;
    data['preferential'] = this.preferential;
    data['img'] = this.img;
    data['showCount'] = this.showCount;
    if (this.shows != null) {
      data['shows'] = this.shows.map((v) => v.toJson()).toList();
    }
    data['globalReleased'] = this.globalReleased;
    data['id'] = this.id;
    data['desc'] = this.desc;
    data['nm'] = this.nm;
    return data;
  }
}

class CinemaMoviesShowdataMoviesShow {
  int preferential;
  String dateShow;
  List<CinemaMoviesShowdataMoviesShowsPlist> plist;
  int hasShow;
  String showDate;

  CinemaMoviesShowdataMoviesShow(
      {this.preferential,
      this.dateShow,
      this.plist,
      this.hasShow,
      this.showDate});

  CinemaMoviesShowdataMoviesShow.fromJson(Map<String, dynamic> json) {
    preferential = json['preferential'];
    dateShow = json['dateShow'];
    if (json['plist'] != null) {
      plist = new List<CinemaMoviesShowdataMoviesShowsPlist>();
      (json['plist'] as List).forEach((v) {
        plist.add(new CinemaMoviesShowdataMoviesShowsPlist.fromJson(v));
      });
    }
    hasShow = json['hasShow'];
    showDate = json['showDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preferential'] = this.preferential;
    data['dateShow'] = this.dateShow;
    if (this.plist != null) {
      data['plist'] = this.plist.map((v) => v.toJson()).toList();
    }
    data['hasShow'] = this.hasShow;
    data['showDate'] = this.showDate;
    return data;
  }
}

class CinemaMoviesShowdataMoviesShowsPlist {
  bool showTypeHighLight;
  String seqNo;
  String showTag;
  String vipPriceSuffix;
  String sellPr;
  String sellPrSuffix;
  int reservedMin;
  bool smallFont;
  String dt;
  int preferential;
  int showClosedSeat;
  String th;
  int ticketStatus;
  int enterShowSeat;
  String vipPrice;
  String vipPriceNameNew;
  String tm;
  bool hallTypeHighLight;
  String lang;
  String tp;
  String vipPriceName;
  String extraDesc;

  CinemaMoviesShowdataMoviesShowsPlist(
      {this.showTypeHighLight,
      this.seqNo,
      this.showTag,
      this.vipPriceSuffix,
      this.sellPr,
      this.sellPrSuffix,
      this.reservedMin,
      this.smallFont,
      this.dt,
      this.preferential,
      this.showClosedSeat,
      this.th,
      this.ticketStatus,
      this.enterShowSeat,
      this.vipPrice,
      this.vipPriceNameNew,
      this.tm,
      this.hallTypeHighLight,
      this.lang,
      this.tp,
      this.vipPriceName,
      this.extraDesc});

  CinemaMoviesShowdataMoviesShowsPlist.fromJson(Map<String, dynamic> json) {
    showTypeHighLight = json['showTypeHighLight'];
    seqNo = json['seqNo'];
    showTag = json['showTag'];
    vipPriceSuffix = json['vipPriceSuffix'];
    sellPr = json['sellPr'];
    sellPrSuffix = json['sellPrSuffix'];
    reservedMin = json['reservedMin'];
    smallFont = json['smallFont'];
    dt = json['dt'];
    preferential = json['preferential'];
    showClosedSeat = json['showClosedSeat'];
    th = json['th'];
    ticketStatus = json['ticketStatus'];
    enterShowSeat = json['enterShowSeat'];
    vipPrice = json['vipPrice'];
    vipPriceNameNew = json['vipPriceNameNew'];
    tm = json['tm'];
    hallTypeHighLight = json['hallTypeHighLight'];
    lang = json['lang'];
    tp = json['tp'];
    vipPriceName = json['vipPriceName'];
    extraDesc = json['extraDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['showTypeHighLight'] = this.showTypeHighLight;
    data['seqNo'] = this.seqNo;
    data['showTag'] = this.showTag;
    data['vipPriceSuffix'] = this.vipPriceSuffix;
    data['sellPr'] = this.sellPr;
    data['sellPrSuffix'] = this.sellPrSuffix;
    data['reservedMin'] = this.reservedMin;
    data['smallFont'] = this.smallFont;
    data['dt'] = this.dt;
    data['preferential'] = this.preferential;
    data['showClosedSeat'] = this.showClosedSeat;
    data['th'] = this.th;
    data['ticketStatus'] = this.ticketStatus;
    data['enterShowSeat'] = this.enterShowSeat;
    data['vipPrice'] = this.vipPrice;
    data['vipPriceNameNew'] = this.vipPriceNameNew;
    data['tm'] = this.tm;
    data['hallTypeHighLight'] = this.hallTypeHighLight;
    data['lang'] = this.lang;
    data['tp'] = this.tp;
    data['vipPriceName'] = this.vipPriceName;
    data['extraDesc'] = this.extraDesc;
    return data;
  }
}

class CinemaMoviesShowdataVipinfo {
  int isCardSales;
  String process;
  String tag;
  String title;
  String url;

  CinemaMoviesShowdataVipinfo(
      {this.isCardSales, this.process, this.tag, this.title, this.url});

  CinemaMoviesShowdataVipinfo.fromJson(Map<String, dynamic> json) {
    isCardSales = json['isCardSales'];
    process = json['process'];
    tag = json['tag'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isCardSales'] = this.isCardSales;
    data['process'] = this.process;
    data['tag'] = this.tag;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class CinemaMoviesCinemadata {
  double lng;
  int cinemaId;
  bool sell;
  int shopId;
  String addr;
  double lat;
  String nm;

  CinemaMoviesCinemadata(
      {this.lng,
      this.cinemaId,
      this.sell,
      this.shopId,
      this.addr,
      this.lat,
      this.nm});

  CinemaMoviesCinemadata.fromJson(Map<String, dynamic> json) {
    lng = json['lng'];
    cinemaId = json['cinemaId'];
    sell = json['sell'];
    shopId = json['shopId'];
    addr = json['addr'];
    lat = json['lat'];
    nm = json['nm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lng'] = this.lng;
    data['cinemaId'] = this.cinemaId;
    data['sell'] = this.sell;
    data['shopId'] = this.shopId;
    data['addr'] = this.addr;
    data['lat'] = this.lat;
    data['nm'] = this.nm;
    return data;
  }
}

class CinemaMoviesDeallist {
  List<CinemaMoviesDeallistDividedeallist> divideDealList;
  int showCount;
  CinemaMoviesDeallistActivity activity;
  String stid;
  int totalCount;
  List<CinemaMoviesDeallistDeallist> dealList;

  CinemaMoviesDeallist(
      {this.divideDealList,
      this.showCount,
      this.activity,
      this.stid,
      this.totalCount,
      this.dealList});

  CinemaMoviesDeallist.fromJson(Map<String, dynamic> json) {
    if (json['divideDealList'] != null) {
      divideDealList = new List<CinemaMoviesDeallistDividedeallist>();
      (json['divideDealList'] as List).forEach((v) {
        divideDealList.add(new CinemaMoviesDeallistDividedeallist.fromJson(v));
      });
    }
    showCount = json['showCount'];
    activity = json['activity'] != null
        ? new CinemaMoviesDeallistActivity.fromJson(json['activity'])
        : null;
    stid = json['stid'];
    totalCount = json['totalCount'];
    if (json['dealList'] != null) {
      dealList = new List<CinemaMoviesDeallistDeallist>();
      (json['dealList'] as List).forEach((v) {
        dealList.add(new CinemaMoviesDeallistDeallist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.divideDealList != null) {
      data['divideDealList'] =
          this.divideDealList.map((v) => v.toJson()).toList();
    }
    data['showCount'] = this.showCount;
    if (this.activity != null) {
      data['activity'] = this.activity.toJson();
    }
    data['stid'] = this.stid;
    data['totalCount'] = this.totalCount;
    if (this.dealList != null) {
      data['dealList'] = this.dealList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CinemaMoviesDeallistDividedeallist {
  int total;
  int showCount;
  int titleId;
  String title;
  List<CinemaMoviesDeallistDividedeallistDeallist> dealList;

  CinemaMoviesDeallistDividedeallist(
      {this.total, this.showCount, this.titleId, this.title, this.dealList});

  CinemaMoviesDeallistDividedeallist.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    showCount = json['showCount'];
    titleId = json['titleId'];
    title = json['title'];
    if (json['dealList'] != null) {
      dealList = new List<CinemaMoviesDeallistDividedeallistDeallist>();
      (json['dealList'] as List).forEach((v) {
        dealList
            .add(new CinemaMoviesDeallistDividedeallistDeallist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['showCount'] = this.showCount;
    data['titleId'] = this.titleId;
    data['title'] = this.title;
    if (this.dealList != null) {
      data['dealList'] = this.dealList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CinemaMoviesDeallistDividedeallistDeallist {
  String firstTitle;
  int recommendPersonNum;
  dynamic supportFastMeal;
  String redirectUrl;
  String curNumberDesc;
  int promotionPrice;
  int dealId;
  dynamic leftCornerTagUrl;
  dynamic discountCardTag;
  int maxNumberPerOrder;
  dynamic promotionTag;
  dynamic discountCardPrice;
  String title;
  int curNumber;
  int promotionId;
  int useEndTime;
  dynamic price;
  String imageUrl;
  dynamic newDeal;
  dynamic recommendTag;
  dynamic menus;
  int cardTagType;
  dynamic value;
  dynamic rightCornerTagUrl;
  int verifyEndTime;
  bool priceChange;
  String packageUpgradeTag;
  int useBeginTime;
  int maxNumberPerMobile;
  dynamic unionPromotionTag;
  bool groupDealFlag;
  String titleTag;
  int buyButton;
  CinemaMoviesDeallistDividedeallistDeallistPackageupgrade packageUpgrade;
  String cardTag;
  dynamic promotionLogo;
  int verifyBeginTime;
  int maxNumberPerUser;
  String secondTitle;
  int category;

  CinemaMoviesDeallistDividedeallistDeallist(
      {this.firstTitle,
      this.recommendPersonNum,
      this.supportFastMeal,
      this.redirectUrl,
      this.curNumberDesc,
      this.promotionPrice,
      this.dealId,
      this.leftCornerTagUrl,
      this.discountCardTag,
      this.maxNumberPerOrder,
      this.promotionTag,
      this.discountCardPrice,
      this.title,
      this.curNumber,
      this.promotionId,
      this.useEndTime,
      this.price,
      this.imageUrl,
      this.newDeal,
      this.recommendTag,
      this.menus,
      this.cardTagType,
      this.value,
      this.rightCornerTagUrl,
      this.verifyEndTime,
      this.priceChange,
      this.packageUpgradeTag,
      this.useBeginTime,
      this.maxNumberPerMobile,
      this.unionPromotionTag,
      this.groupDealFlag,
      this.titleTag,
      this.buyButton,
      this.packageUpgrade,
      this.cardTag,
      this.promotionLogo,
      this.verifyBeginTime,
      this.maxNumberPerUser,
      this.secondTitle,
      this.category});

  CinemaMoviesDeallistDividedeallistDeallist.fromJson(
      Map<String, dynamic> json) {
    firstTitle = json['firstTitle'];
    recommendPersonNum = json['recommendPersonNum'];
    supportFastMeal = json['supportFastMeal'];
    redirectUrl = json['redirectUrl'];
    curNumberDesc = json['curNumberDesc'];
    promotionPrice = json['promotionPrice'];
    dealId = json['dealId'];
    leftCornerTagUrl = json['leftCornerTagUrl'];
    discountCardTag = json['discountCardTag'];
    maxNumberPerOrder = json['maxNumberPerOrder'];
    promotionTag = json['promotionTag'];
    discountCardPrice = json['discountCardPrice'];
    title = json['title'];
    curNumber = json['curNumber'];
    promotionId = json['promotionId'];
    useEndTime = json['useEndTime'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    newDeal = json['newDeal'];
    recommendTag = json['recommendTag'];
    menus = json['menus'];
    cardTagType = json['cardTagType'];
    value = json['value'];
    rightCornerTagUrl = json['rightCornerTagUrl'];
    verifyEndTime = json['verifyEndTime'];
    priceChange = json['priceChange'];
    packageUpgradeTag = json['packageUpgradeTag'];
    useBeginTime = json['useBeginTime'];
    maxNumberPerMobile = json['maxNumberPerMobile'];
    unionPromotionTag = json['unionPromotionTag'];
    groupDealFlag = json['groupDealFlag'];
    titleTag = json['titleTag'];
    buyButton = json['buyButton'];
    packageUpgrade = json['packageUpgrade'] != null
        ? new CinemaMoviesDeallistDividedeallistDeallistPackageupgrade.fromJson(
            json['packageUpgrade'])
        : null;
    cardTag = json['cardTag'];
    promotionLogo = json['promotionLogo'];
    verifyBeginTime = json['verifyBeginTime'];
    maxNumberPerUser = json['maxNumberPerUser'];
    secondTitle = json['secondTitle'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstTitle'] = this.firstTitle;
    data['recommendPersonNum'] = this.recommendPersonNum;
    data['supportFastMeal'] = this.supportFastMeal;
    data['redirectUrl'] = this.redirectUrl;
    data['curNumberDesc'] = this.curNumberDesc;
    data['promotionPrice'] = this.promotionPrice;
    data['dealId'] = this.dealId;
    data['leftCornerTagUrl'] = this.leftCornerTagUrl;
    data['discountCardTag'] = this.discountCardTag;
    data['maxNumberPerOrder'] = this.maxNumberPerOrder;
    data['promotionTag'] = this.promotionTag;
    data['discountCardPrice'] = this.discountCardPrice;
    data['title'] = this.title;
    data['curNumber'] = this.curNumber;
    data['promotionId'] = this.promotionId;
    data['useEndTime'] = this.useEndTime;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['newDeal'] = this.newDeal;
    data['recommendTag'] = this.recommendTag;
    data['menus'] = this.menus;
    data['cardTagType'] = this.cardTagType;
    data['value'] = this.value;
    data['rightCornerTagUrl'] = this.rightCornerTagUrl;
    data['verifyEndTime'] = this.verifyEndTime;
    data['priceChange'] = this.priceChange;
    data['packageUpgradeTag'] = this.packageUpgradeTag;
    data['useBeginTime'] = this.useBeginTime;
    data['maxNumberPerMobile'] = this.maxNumberPerMobile;
    data['unionPromotionTag'] = this.unionPromotionTag;
    data['groupDealFlag'] = this.groupDealFlag;
    data['titleTag'] = this.titleTag;
    data['buyButton'] = this.buyButton;
    if (this.packageUpgrade != null) {
      data['packageUpgrade'] = this.packageUpgrade.toJson();
    }
    data['cardTag'] = this.cardTag;
    data['promotionLogo'] = this.promotionLogo;
    data['verifyBeginTime'] = this.verifyBeginTime;
    data['maxNumberPerUser'] = this.maxNumberPerUser;
    data['secondTitle'] = this.secondTitle;
    data['category'] = this.category;
    return data;
  }
}

class CinemaMoviesDeallistDividedeallistDeallistPackageupgrade {
  String icon;
  String title;
  String content;

  CinemaMoviesDeallistDividedeallistDeallistPackageupgrade(
      {this.icon, this.title, this.content});

  CinemaMoviesDeallistDividedeallistDeallistPackageupgrade.fromJson(
      Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['content'] = this.content;
    return data;
  }
}

class CinemaMoviesDeallistActivity {
  String color;
  bool defaultValue;
  dynamic couponsContent;
  String icon;
  bool hasCoupons;
  String title;
  dynamic banners;
  String jumpUrl;
  CinemaMoviesDeallistActivityCinemachannelbanner cinemaChannelBanner;
  int cinemaId;
  dynamic couponInfoList;
  bool isFastMeal;
  String tag;
  int beginTime;
  int endTime;
  int poiId;
  String desc;

  CinemaMoviesDeallistActivity(
      {this.color,
      this.defaultValue,
      this.couponsContent,
      this.icon,
      this.hasCoupons,
      this.title,
      this.banners,
      this.jumpUrl,
      this.cinemaChannelBanner,
      this.cinemaId,
      this.couponInfoList,
      this.isFastMeal,
      this.tag,
      this.beginTime,
      this.endTime,
      this.poiId,
      this.desc});

  CinemaMoviesDeallistActivity.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    defaultValue = json['defaultValue'];
    couponsContent = json['couponsContent'];
    icon = json['icon'];
    hasCoupons = json['hasCoupons'];
    title = json['title'];
    banners = json['banners'];
    jumpUrl = json['jumpUrl'];
    cinemaChannelBanner = json['cinemaChannelBanner'] != null
        ? new CinemaMoviesDeallistActivityCinemachannelbanner.fromJson(
            json['cinemaChannelBanner'])
        : null;
    cinemaId = json['cinemaId'];
    couponInfoList = json['couponInfoList'];
    isFastMeal = json['isFastMeal'];
    tag = json['tag'];
    beginTime = json['beginTime'];
    endTime = json['endTime'];
    poiId = json['poiId'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['defaultValue'] = this.defaultValue;
    data['couponsContent'] = this.couponsContent;
    data['icon'] = this.icon;
    data['hasCoupons'] = this.hasCoupons;
    data['title'] = this.title;
    data['banners'] = this.banners;
    data['jumpUrl'] = this.jumpUrl;
    if (this.cinemaChannelBanner != null) {
      data['cinemaChannelBanner'] = this.cinemaChannelBanner.toJson();
    }
    data['cinemaId'] = this.cinemaId;
    data['couponInfoList'] = this.couponInfoList;
    data['isFastMeal'] = this.isFastMeal;
    data['tag'] = this.tag;
    data['beginTime'] = this.beginTime;
    data['endTime'] = this.endTime;
    data['poiId'] = this.poiId;
    data['desc'] = this.desc;
    return data;
  }
}

class CinemaMoviesDeallistActivityCinemachannelbanner {
  String imageUrl;
  String jumpUrl;

  CinemaMoviesDeallistActivityCinemachannelbanner(
      {this.imageUrl, this.jumpUrl});

  CinemaMoviesDeallistActivityCinemachannelbanner.fromJson(
      Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    jumpUrl = json['jumpUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['jumpUrl'] = this.jumpUrl;
    return data;
  }
}

class CinemaMoviesDeallistDeallist {
  int recommendPersonNum;
  dynamic promotionLogo;
  String redirectUrl;
  String curNumberDesc;
  int promotionPrice;
  dynamic price;
  String imageUrl;
  dynamic discountCardPrice;
  int cardTagType;
  String title;
  int buyButton;
  String cardTag;

  CinemaMoviesDeallistDeallist(
      {this.recommendPersonNum,
      this.promotionLogo,
      this.redirectUrl,
      this.curNumberDesc,
      this.promotionPrice,
      this.price,
      this.imageUrl,
      this.discountCardPrice,
      this.cardTagType,
      this.title,
      this.buyButton,
      this.cardTag});

  CinemaMoviesDeallistDeallist.fromJson(Map<String, dynamic> json) {
    recommendPersonNum = json['recommendPersonNum'];
    promotionLogo = json['promotionLogo'];
    redirectUrl = json['redirectUrl'];
    curNumberDesc = json['curNumberDesc'];
    promotionPrice = json['promotionPrice'];
    price = json['price'];
    imageUrl = json['imageUrl'];
    discountCardPrice = json['discountCardPrice'];
    cardTagType = json['cardTagType'];
    title = json['title'];
    buyButton = json['buyButton'];
    cardTag = json['cardTag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recommendPersonNum'] = this.recommendPersonNum;
    data['promotionLogo'] = this.promotionLogo;
    data['redirectUrl'] = this.redirectUrl;
    data['curNumberDesc'] = this.curNumberDesc;
    data['promotionPrice'] = this.promotionPrice;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['discountCardPrice'] = this.discountCardPrice;
    data['cardTagType'] = this.cardTagType;
    data['title'] = this.title;
    data['buyButton'] = this.buyButton;
    data['cardTag'] = this.cardTag;
    return data;
  }
}

class CinemaMoviesStone {
  String fontSource;
  CinemaMoviesStoneFonts fonts;
  dynamic unicodeMap;

  CinemaMoviesStone({this.fontSource, this.fonts, this.unicodeMap});

  CinemaMoviesStone.fromJson(Map<String, dynamic> json) {
    fontSource = json['fontSource'];
    fonts = json['fonts'] != null
        ? new CinemaMoviesStoneFonts.fromJson(json['fonts'])
        : null;
    unicodeMap = json['unicodeMap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fontSource'] = this.fontSource;
    if (this.fonts != null) {
      data['fonts'] = this.fonts.toJson();
    }
    data['unicodeMap'] = this.unicodeMap;
    return data;
  }
}

class CinemaMoviesStoneFonts {
  String woff;

  CinemaMoviesStoneFonts({this.woff});

  CinemaMoviesStoneFonts.fromJson(Map<String, dynamic> json) {
    woff = json['woff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['woff'] = this.woff;
    return data;
  }
}
