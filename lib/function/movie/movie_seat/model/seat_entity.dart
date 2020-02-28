class SeatEntity {
  SeatSeatdata seatData;

  SeatEntity({this.seatData});

  SeatEntity.fromJson(Map<String, dynamic> json) {
    seatData = json['seatData'] != null
        ? new SeatSeatdata.fromJson(json['seatData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seatData != null) {
      data['seatData'] = this.seatData.toJson();
    }
    return data;
  }
}

class SeatSeatdata {
  SeatSeatdataSeat seat;
  SeatSeatdataMovie movie;
  SeatSeatdataReminder reminder;
  var price;
  bool shareSeat;
  SeatSeatdataShow xShow;
  String mobile;
  SeatSeatdataHall hall;
  SeatSeatdataCinema cinema;
  SeatSeatdataUser user;
  String token;
  String utmContent;

  SeatSeatdata(
      {this.seat,
      this.movie,
      this.reminder,
      this.price,
      this.shareSeat,
      this.xShow,
      this.mobile,
      this.hall,
      this.cinema,
      this.user,
      this.token,
      this.utmContent});

  SeatSeatdata.fromJson(Map<String, dynamic> json) {
    seat = json['seat'] != null
        ? new SeatSeatdataSeat.fromJson(json['seat'])
        : null;
    movie = json['movie'] != null
        ? new SeatSeatdataMovie.fromJson(json['movie'])
        : null;
    reminder = json['reminder'] != null
        ? new SeatSeatdataReminder.fromJson(json['reminder'])
        : null;
    price = json['price'];
    shareSeat = json['shareSeat'];
    xShow = json['show'] != null
        ? new SeatSeatdataShow.fromJson(json['show'])
        : null;
    mobile = json['mobile'];
    hall = json['hall'] != null
        ? new SeatSeatdataHall.fromJson(json['hall'])
        : null;
    cinema = json['cinema'] != null
        ? new SeatSeatdataCinema.fromJson(json['cinema'])
        : null;
    user = json['user'] != null
        ? new SeatSeatdataUser.fromJson(json['user'])
        : null;
    token = json['token'];
    utmContent = json['utm_content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seat != null) {
      data['seat'] = this.seat.toJson();
    }
    if (this.movie != null) {
      data['movie'] = this.movie.toJson();
    }
    if (this.reminder != null) {
      data['reminder'] = this.reminder.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price;
    }
    data['shareSeat'] = this.shareSeat;
    if (this.xShow != null) {
      data['show'] = this.xShow.toJson();
    }
    data['mobile'] = this.mobile;
    if (this.hall != null) {
      data['hall'] = this.hall.toJson();
    }
    if (this.cinema != null) {
      data['cinema'] = this.cinema.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    data['utm_content'] = this.utmContent;
    return data;
  }
}

class SeatSeatdataSeat {
  SeatSeatdataSeatImage image;
  SeatSeatdataSeatLastselectedseat lastSelectedSeat;
  List<SeatSeatdataSeatRegion> regions;
  SeatSeatdataSeatRecommendation recommendation;

  SeatSeatdataSeat({
    this.image,
    this.lastSelectedSeat,
    this.regions,
    this.recommendation,
  });

  SeatSeatdataSeat.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null
        ? new SeatSeatdataSeatImage.fromJson(json['image'])
        : null;
    lastSelectedSeat = json['lastSelectedSeat'] != null
        ? new SeatSeatdataSeatLastselectedseat.fromJson(
            json['lastSelectedSeat'])
        : null;
    if (json['regions'] != null) {
      regions = new List<SeatSeatdataSeatRegion>();
      (json['regions'] as List).forEach((v) {
        regions.add(new SeatSeatdataSeatRegion.fromJson(v));
      });
    }
    recommendation = json['recommendation'] != null
        ? new SeatSeatdataSeatRecommendation.fromJson(json['recommendation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.lastSelectedSeat != null) {
      data['lastSelectedSeat'] = this.lastSelectedSeat.toJson();
    }
    if (this.regions != null) {
      data['regions'] = this.regions.map((v) => v.toJson()).toList();
    }
    if (this.recommendation != null) {
      data['recommendation'] = this.recommendation.toJson();
    }
    return data;
  }
}

class SeatSeatdataSeatImage {
  bool doIconRain;
  bool displayAd;
  dynamic adReport;
  int iconRainTriggerMillis;
  List<Null> selectSeatImages;
  List<SeatSeatdataSeatImageSeatlegend> seatLegends;
  List<Null> soldImages;
  List<Null> selectedImages;

  SeatSeatdataSeatImage(
      {this.doIconRain,
      this.displayAd,
      this.adReport,
      this.iconRainTriggerMillis,
      this.selectSeatImages,
      this.seatLegends,
      this.soldImages,
      this.selectedImages});

  SeatSeatdataSeatImage.fromJson(Map<String, dynamic> json) {
    doIconRain = json['doIconRain'];
    displayAd = json['displayAd'];
    adReport = json['adReport'];
    iconRainTriggerMillis = json['iconRainTriggerMillis'];
    if (json['selectSeatImages'] != null) {
      selectSeatImages = new List<Null>();
    }
    if (json['seatLegends'] != null) {
      seatLegends = new List<SeatSeatdataSeatImageSeatlegend>();
      (json['seatLegends'] as List).forEach((v) {
        seatLegends.add(new SeatSeatdataSeatImageSeatlegend.fromJson(v));
      });
    }
    if (json['soldImages'] != null) {
      soldImages = new List<Null>();
    }
    if (json['selectedImages'] != null) {
      selectedImages = new List<Null>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doIconRain'] = this.doIconRain;
    data['displayAd'] = this.displayAd;
    data['adReport'] = this.adReport;
    data['iconRainTriggerMillis'] = this.iconRainTriggerMillis;
    if (this.selectSeatImages != null) {
      data['selectSeatImages'] = [];
    }
    if (this.seatLegends != null) {
      data['seatLegends'] = this.seatLegends.map((v) => v.toJson()).toList();
    }
    if (this.soldImages != null) {
      data['soldImages'] = [];
    }
    if (this.selectedImages != null) {
      data['selectedImages'] = [];
    }
    return data;
  }
}

class SeatSeatdataSeatImageSeatlegend {
  String legendIcon;
  String legendName;

  SeatSeatdataSeatImageSeatlegend({this.legendIcon, this.legendName});

  SeatSeatdataSeatImageSeatlegend.fromJson(Map<String, dynamic> json) {
    legendIcon = json['legendIcon'];
    legendName = json['legendName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['legendIcon'] = this.legendIcon;
    data['legendName'] = this.legendName;
    return data;
  }

  @override
  String toString() {
    return 'SeatSeatdataSeatImageSeatlegend{legendIcon: $legendIcon, legendName: $legendName}';
  }
}

class SeatSeatdataSeatLastselectedseat {
  String selectedSeatType;
  String selectedSeats;
  String selectedRegionId;

  SeatSeatdataSeatLastselectedseat(
      {this.selectedSeatType, this.selectedSeats, this.selectedRegionId});

  SeatSeatdataSeatLastselectedseat.fromJson(Map<String, dynamic> json) {
    selectedSeatType = json['selectedSeatType'];
    selectedSeats = json['selectedSeats'];
    selectedRegionId = json['selectedRegionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['selectedSeatType'] = this.selectedSeatType;
    data['selectedSeats'] = this.selectedSeats;
    data['selectedRegionId'] = this.selectedRegionId;
    return data;
  }
}

class SeatSeatdataSeatRegion {
  String regionId;
  int columnSize;
  String regionName;
  List<SeatSeatdataSeatRegionsRow> rows;
  int rowSize;

  SeatSeatdataSeatRegion(
      {this.regionId,
      this.columnSize,
      this.regionName,
      this.rows,
      this.rowSize});

  SeatSeatdataSeatRegion.fromJson(Map<String, dynamic> json) {
    regionId = json['regionId'];
    columnSize = json['columnSize'];
    regionName = json['regionName'];
    if (json['rows'] != null) {
      rows = new List<SeatSeatdataSeatRegionsRow>();
      (json['rows'] as List).forEach((v) {
        rows.add(new SeatSeatdataSeatRegionsRow.fromJson(v));
      });
    }
    rowSize = json['rowSize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regionId'] = this.regionId;
    data['columnSize'] = this.columnSize;
    data['regionName'] = this.regionName;
    if (this.rows != null) {
      data['rows'] = this.rows.map((v) => v.toJson()).toList();
    }
    data['rowSize'] = this.rowSize;
    return data;
  }
}

class SeatSeatdataSeatRegionsRow {
  int rowNum;
  List<SeatSeatdataSeatRegionsRowsSeat> seats;
  String rowId;

  SeatSeatdataSeatRegionsRow({this.rowNum, this.seats, this.rowId});

  SeatSeatdataSeatRegionsRow.fromJson(Map<String, dynamic> json) {
    rowNum = json['rowNum'];
    if (json['seats'] != null) {
      seats = new List<SeatSeatdataSeatRegionsRowsSeat>();
      (json['seats'] as List).forEach((v) {
        seats.add(new SeatSeatdataSeatRegionsRowsSeat.fromJson(v));
      });
    }
    rowId = json['rowId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rowNum'] = this.rowNum;
    if (this.seats != null) {
      data['seats'] = this.seats.map((v) => v.toJson()).toList();
    }
    data['rowId'] = this.rowId;
    return data;
  }
}

class SeatSeatdataSeatRegionsRowsSeat {
  int seatStatus;
  String seatType;
  String columnId;
  String sectionId;
  String seatNo;
  String rowId;

  SeatSeatdataSeatRegionsRowsSeat(
      {this.seatStatus,
      this.seatType,
      this.columnId,
      this.sectionId,
      this.seatNo,
      this.rowId});

  SeatSeatdataSeatRegionsRowsSeat.fromJson(Map<String, dynamic> json) {
    seatStatus = json['seatStatus'];
    seatType = json['seatType'];
    columnId = json['columnId'];
    sectionId = json['sectionId'];
    seatNo = json['seatNo'];
    rowId = json['rowId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seatStatus'] = this.seatStatus;
    data['seatType'] = this.seatType;
    data['columnId'] = this.columnId;
    data['sectionId'] = this.sectionId;
    data['seatNo'] = this.seatNo;
    data['rowId'] = this.rowId;
    return data;
  }
}

class SeatSeatdataSeatRecommendation {
  SeatSeatdataSeatRecommendationBestrecommendation bestRecommendation;
  int isShowRecommendation;

  SeatSeatdataSeatRecommendation(
      {this.bestRecommendation, this.isShowRecommendation});

  SeatSeatdataSeatRecommendation.fromJson(Map<String, dynamic> json) {
    bestRecommendation = json['bestRecommendation'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendation.fromJson(
            json['bestRecommendation'])
        : null;
    isShowRecommendation = json['isShowRecommendation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bestRecommendation != null) {
      data['bestRecommendation'] = this.bestRecommendation.toJson();
    }
    data['isShowRecommendation'] = this.isShowRecommendation;
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendation {
  SeatSeatdataSeatRecommendationBestrecommendationBestfour bestFour;
  SeatSeatdataSeatRecommendationBestrecommendationBestthree bestThree;
  SeatSeatdataSeatRecommendationBestrecommendationBestone bestOne;
  SeatSeatdataSeatRecommendationBestrecommendationBesttwo bestTwo;
  SeatSeatdataSeatRecommendationBestrecommendationBestfive bestFive;

  SeatSeatdataSeatRecommendationBestrecommendation(
      {this.bestFour,
      this.bestThree,
      this.bestOne,
      this.bestTwo,
      this.bestFive});

  SeatSeatdataSeatRecommendationBestrecommendation.fromJson(
      Map<String, dynamic> json) {
    bestFour = json['bestFour'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendationBestfour.fromJson(
            json['bestFour'])
        : null;
    bestThree = json['bestThree'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendationBestthree
            .fromJson(json['bestThree'])
        : null;
    bestOne = json['bestOne'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendationBestone.fromJson(
            json['bestOne'])
        : null;
    bestTwo = json['bestTwo'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendationBesttwo.fromJson(
            json['bestTwo'])
        : null;
    bestFive = json['bestFive'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendationBestfive.fromJson(
            json['bestFive'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bestFour != null) {
      data['bestFour'] = this.bestFour.toJson();
    }
    if (this.bestThree != null) {
      data['bestThree'] = this.bestThree.toJson();
    }
    if (this.bestOne != null) {
      data['bestOne'] = this.bestOne.toJson();
    }
    if (this.bestTwo != null) {
      data['bestTwo'] = this.bestTwo.toJson();
    }
    if (this.bestFive != null) {
      data['bestFive'] = this.bestFive.toJson();
    }
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendationBestfour {
  SeatSeatdataSeatRecommendationBestrecommendationBestfourSeatdesc seatDesc;
  List<SeatSeatdataSeatRecommandationBestrecommandationBestfourSeats> seats;

  SeatSeatdataSeatRecommendationBestrecommendationBestfour(
      {this.seatDesc, this.seats});

  SeatSeatdataSeatRecommendationBestrecommendationBestfour.fromJson(
      Map<String, dynamic> json) {
    seatDesc = json['seatDesc'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendationBestfourSeatdesc
            .fromJson(json['seatDesc'])
        : null;
    if (json['seats'] != null) {
      seats = new List<
          SeatSeatdataSeatRecommandationBestrecommandationBestfourSeats>();
      (json['seats'] as List).forEach((v) {
        seats.add(
            new SeatSeatdataSeatRecommandationBestrecommandationBestfourSeats
                .fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seatDesc != null) {
      data['seatDesc'] = this.seatDesc.toJson();
    }
    if (this.seats != null) {
      data['seats'] = this.seats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendationBestfourSeatdesc {
  String img;
  String remind;

  SeatSeatdataSeatRecommendationBestrecommendationBestfourSeatdesc(
      {this.img, this.remind});

  SeatSeatdataSeatRecommendationBestrecommendationBestfourSeatdesc.fromJson(
      Map<String, dynamic> json) {
    img = json['img'];
    remind = json['remind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['remind'] = this.remind;
    return data;
  }
}

class SeatSeatdataSeatRecommandationBestrecommandationBestfourSeats {
  String columnId;
  int rowNum;
  String sectionId;
  String rowId;

  SeatSeatdataSeatRecommandationBestrecommandationBestfourSeats(
      {this.columnId, this.rowNum, this.sectionId, this.rowId});

  SeatSeatdataSeatRecommandationBestrecommandationBestfourSeats.fromJson(
      Map<String, dynamic> json) {
    columnId = json['columnId'];
    rowNum = json['rowNum'];
    sectionId = json['sectionId'];
    rowId = json['rowId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columnId'] = this.columnId;
    data['rowNum'] = this.rowNum;
    data['sectionId'] = this.sectionId;
    data['rowId'] = this.rowId;
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendationBestthree {
  SeatSeatdataSeatRecommendationBestrecommendationBestthreeSeatdesc seatDesc;
  List<SeatSeatdataSeatRecommandationBestrecommandationBestthreeSeats> seats;

  SeatSeatdataSeatRecommendationBestrecommendationBestthree(
      {this.seatDesc, this.seats});

  SeatSeatdataSeatRecommendationBestrecommendationBestthree.fromJson(
      Map<String, dynamic> json) {
    seatDesc = json['seatDesc'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendationBestthreeSeatdesc
            .fromJson(json['seatDesc'])
        : null;
    if (json['seats'] != null) {
      seats = new List<
          SeatSeatdataSeatRecommandationBestrecommandationBestthreeSeats>();
      (json['seats'] as List).forEach((v) {
        seats.add(
            new SeatSeatdataSeatRecommandationBestrecommandationBestthreeSeats
                .fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seatDesc != null) {
      data['seatDesc'] = this.seatDesc.toJson();
    }
    if (this.seats != null) {
      data['seats'] = this.seats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendationBestthreeSeatdesc {
  String img;
  String remind;

  SeatSeatdataSeatRecommendationBestrecommendationBestthreeSeatdesc(
      {this.img, this.remind});

  SeatSeatdataSeatRecommendationBestrecommendationBestthreeSeatdesc.fromJson(
      Map<String, dynamic> json) {
    img = json['img'];
    remind = json['remind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['remind'] = this.remind;
    return data;
  }
}

class SeatSeatdataSeatRecommandationBestrecommandationBestthreeSeats {
  String columnId;
  int rowNum;
  String sectionId;
  String rowId;

  SeatSeatdataSeatRecommandationBestrecommandationBestthreeSeats(
      {this.columnId, this.rowNum, this.sectionId, this.rowId});

  SeatSeatdataSeatRecommandationBestrecommandationBestthreeSeats.fromJson(
      Map<String, dynamic> json) {
    columnId = json['columnId'];
    rowNum = json['rowNum'];
    sectionId = json['sectionId'];
    rowId = json['rowId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columnId'] = this.columnId;
    data['rowNum'] = this.rowNum;
    data['sectionId'] = this.sectionId;
    data['rowId'] = this.rowId;
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendationBestone {
  SeatSeatdataSeatRecommendationBestrecommendationBestoneSeatdesc seatDesc;
  List<SeatSeatdataSeatRecommandationBestrecommandationBestoneSeats> seats;

  SeatSeatdataSeatRecommendationBestrecommendationBestone(
      {this.seatDesc, this.seats});

  SeatSeatdataSeatRecommendationBestrecommendationBestone.fromJson(
      Map<String, dynamic> json) {
    seatDesc = json['seatDesc'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendationBestoneSeatdesc
            .fromJson(json['seatDesc'])
        : null;
    if (json['seats'] != null) {
      seats = new List<
          SeatSeatdataSeatRecommandationBestrecommandationBestoneSeats>();
      (json['seats'] as List).forEach((v) {
        seats.add(
            new SeatSeatdataSeatRecommandationBestrecommandationBestoneSeats
                .fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seatDesc != null) {
      data['seatDesc'] = this.seatDesc.toJson();
    }
    if (this.seats != null) {
      data['seats'] = this.seats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendationBestoneSeatdesc {
  String img;
  String remind;

  SeatSeatdataSeatRecommendationBestrecommendationBestoneSeatdesc(
      {this.img, this.remind});

  SeatSeatdataSeatRecommendationBestrecommendationBestoneSeatdesc.fromJson(
      Map<String, dynamic> json) {
    img = json['img'];
    remind = json['remind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['remind'] = this.remind;
    return data;
  }
}

class SeatSeatdataSeatRecommandationBestrecommandationBestoneSeats {
  String columnId;
  int rowNum;
  String sectionId;
  String rowId;

  SeatSeatdataSeatRecommandationBestrecommandationBestoneSeats(
      {this.columnId, this.rowNum, this.sectionId, this.rowId});

  SeatSeatdataSeatRecommandationBestrecommandationBestoneSeats.fromJson(
      Map<String, dynamic> json) {
    columnId = json['columnId'];
    rowNum = json['rowNum'];
    sectionId = json['sectionId'];
    rowId = json['rowId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columnId'] = this.columnId;
    data['rowNum'] = this.rowNum;
    data['sectionId'] = this.sectionId;
    data['rowId'] = this.rowId;
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendationBesttwo {
  SeatSeatdataSeatRecommendationBestrecommendationBesttwoSeatdesc seatDesc;
  List<SeatSeatdataSeatRecommandationBestrecommandationBesttwoSeats> seats;

  SeatSeatdataSeatRecommendationBestrecommendationBesttwo(
      {this.seatDesc, this.seats});

  SeatSeatdataSeatRecommendationBestrecommendationBesttwo.fromJson(
      Map<String, dynamic> json) {
    seatDesc = json['seatDesc'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendationBesttwoSeatdesc
            .fromJson(json['seatDesc'])
        : null;
    if (json['seats'] != null) {
      seats = new List<
          SeatSeatdataSeatRecommandationBestrecommandationBesttwoSeats>();
      (json['seats'] as List).forEach((v) {
        seats.add(
            new SeatSeatdataSeatRecommandationBestrecommandationBesttwoSeats
                .fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seatDesc != null) {
      data['seatDesc'] = this.seatDesc.toJson();
    }
    if (this.seats != null) {
      data['seats'] = this.seats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendationBesttwoSeatdesc {
  String img;
  String remind;

  SeatSeatdataSeatRecommendationBestrecommendationBesttwoSeatdesc(
      {this.img, this.remind});

  SeatSeatdataSeatRecommendationBestrecommendationBesttwoSeatdesc.fromJson(
      Map<String, dynamic> json) {
    img = json['img'];
    remind = json['remind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['remind'] = this.remind;
    return data;
  }
}

class SeatSeatdataSeatRecommandationBestrecommandationBesttwoSeats {
  String columnId;
  int rowNum;
  String sectionId;
  String rowId;

  SeatSeatdataSeatRecommandationBestrecommandationBesttwoSeats(
      {this.columnId, this.rowNum, this.sectionId, this.rowId});

  SeatSeatdataSeatRecommandationBestrecommandationBesttwoSeats.fromJson(
      Map<String, dynamic> json) {
    columnId = json['columnId'];
    rowNum = json['rowNum'];
    sectionId = json['sectionId'];
    rowId = json['rowId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columnId'] = this.columnId;
    data['rowNum'] = this.rowNum;
    data['sectionId'] = this.sectionId;
    data['rowId'] = this.rowId;
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendationBestfive {
  SeatSeatdataSeatRecommendationBestrecommendationBestfiveSeatdesc seatDesc;
  List<SeatSeatdataSeatRecommandationBestrecommandationBestfiveSeats> seats;

  SeatSeatdataSeatRecommendationBestrecommendationBestfive(
      {this.seatDesc, this.seats});

  SeatSeatdataSeatRecommendationBestrecommendationBestfive.fromJson(
      Map<String, dynamic> json) {
    seatDesc = json['seatDesc'] != null
        ? new SeatSeatdataSeatRecommendationBestrecommendationBestfiveSeatdesc
            .fromJson(json['seatDesc'])
        : null;
    if (json['seats'] != null) {
      seats = new List<
          SeatSeatdataSeatRecommandationBestrecommandationBestfiveSeats>();
      (json['seats'] as List).forEach((v) {
        seats.add(
            new SeatSeatdataSeatRecommandationBestrecommandationBestfiveSeats
                .fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seatDesc != null) {
      data['seatDesc'] = this.seatDesc.toJson();
    }
    if (this.seats != null) {
      data['seats'] = this.seats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeatSeatdataSeatRecommendationBestrecommendationBestfiveSeatdesc {
  String img;
  String remind;

  SeatSeatdataSeatRecommendationBestrecommendationBestfiveSeatdesc(
      {this.img, this.remind});

  SeatSeatdataSeatRecommendationBestrecommendationBestfiveSeatdesc.fromJson(
      Map<String, dynamic> json) {
    img = json['img'];
    remind = json['remind'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['remind'] = this.remind;
    return data;
  }
}

class SeatSeatdataSeatRecommandationBestrecommandationBestfiveSeats {
  String columnId;
  int rowNum;
  String sectionId;
  String rowId;

  SeatSeatdataSeatRecommandationBestrecommandationBestfiveSeats(
      {this.columnId, this.rowNum, this.sectionId, this.rowId});

  SeatSeatdataSeatRecommandationBestrecommandationBestfiveSeats.fromJson(
      Map<String, dynamic> json) {
    columnId = json['columnId'];
    rowNum = json['rowNum'];
    sectionId = json['sectionId'];
    rowId = json['rowId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columnId'] = this.columnId;
    data['rowNum'] = this.rowNum;
    data['sectionId'] = this.sectionId;
    data['rowId'] = this.rowId;
    return data;
  }
}

class SeatSeatdataSeatSection1 {
  String sectionIcon;
  String sectionName;
  String sectionNormalImage;
  String sectionPrice;
  String sectionLoverImage;
  int index;
  String sectionActivity;

  SeatSeatdataSeatSection1(
      {this.sectionIcon,
      this.sectionName,
      this.sectionNormalImage,
      this.sectionPrice,
      this.sectionLoverImage,
      this.index,
      this.sectionActivity});

  SeatSeatdataSeatSection1.fromJson(Map<String, dynamic> json) {
    sectionIcon = json['sectionIcon'];
    sectionName = json['sectionName'];
    sectionNormalImage = json['sectionNormalImage'];
    sectionPrice = json['sectionPrice'];
    sectionLoverImage = json['sectionLoverImage'];
    index = json['index'];
    sectionActivity = json['sectionActivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sectionIcon'] = this.sectionIcon;
    data['sectionName'] = this.sectionName;
    data['sectionNormalImage'] = this.sectionNormalImage;
    data['sectionPrice'] = this.sectionPrice;
    data['sectionLoverImage'] = this.sectionLoverImage;
    data['index'] = this.index;
    data['sectionActivity'] = this.sectionActivity;
    return data;
  }
}

class SeatSeatdataMovie {
  int movieId;
  String movieName;

  SeatSeatdataMovie({this.movieId, this.movieName});

  SeatSeatdataMovie.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId'];
    movieName = json['movieName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movieId'] = this.movieId;
    data['movieName'] = this.movieName;
    return data;
  }
}

class SeatSeatdataReminder {
  String popUpReminder;
  String defaultReminder;
  List<Null> notice;

  SeatSeatdataReminder({this.popUpReminder, this.defaultReminder, this.notice});

  SeatSeatdataReminder.fromJson(Map<String, dynamic> json) {
    popUpReminder = json['popUpReminder'];
    defaultReminder = json['defaultReminder'];
    if (json['notice'] != null) {
      notice = new List<Null>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['popUpReminder'] = this.popUpReminder;
    data['defaultReminder'] = this.defaultReminder;
    if (this.notice != null) {
      data['notice'] = [];
    }
    return data;
  }
}

class SeatSeatdataPrice1Seatsprice1 {
  String totalPrice;
  List<SeatSeatdataPrice1Seatsprice1Desc> desc;

  SeatSeatdataPrice1Seatsprice1({this.totalPrice, this.desc});

  SeatSeatdataPrice1Seatsprice1.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    if (json['desc'] != null) {
      desc = new List<SeatSeatdataPrice1Seatsprice1Desc>();
      (json['desc'] as List).forEach((v) {
        desc.add(new SeatSeatdataPrice1Seatsprice1Desc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this.totalPrice;
    if (this.desc != null) {
      data['desc'] = this.desc.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeatSeatdataPrice1Seatsprice1Desc {
  String activity;
  String price;

  SeatSeatdataPrice1Seatsprice1Desc({this.activity, this.price});

  SeatSeatdataPrice1Seatsprice1Desc.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    data['price'] = this.price;
    return data;
  }
}

class SeatSeatdataPrice1Seatsprice2 {
  String totalPrice;
  List<SeatSeatdataPrice1Seatsprice2Desc> desc;

  SeatSeatdataPrice1Seatsprice2({this.totalPrice, this.desc});

  SeatSeatdataPrice1Seatsprice2.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    if (json['desc'] != null) {
      desc = new List<SeatSeatdataPrice1Seatsprice2Desc>();
      (json['desc'] as List).forEach((v) {
        desc.add(new SeatSeatdataPrice1Seatsprice2Desc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this.totalPrice;
    if (this.desc != null) {
      data['desc'] = this.desc.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeatSeatdataPrice1Seatsprice2Desc {
  String activity;
  String price;

  SeatSeatdataPrice1Seatsprice2Desc({this.activity, this.price});

  SeatSeatdataPrice1Seatsprice2Desc.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    data['price'] = this.price;
    return data;
  }
}

class SeatSeatdataPrice1Seatsprice3 {
  String totalPrice;
  List<SeatSeatdataPrice1Seatsprice3Desc> desc;

  SeatSeatdataPrice1Seatsprice3({this.totalPrice, this.desc});

  SeatSeatdataPrice1Seatsprice3.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    if (json['desc'] != null) {
      desc = new List<SeatSeatdataPrice1Seatsprice3Desc>();
      (json['desc'] as List).forEach((v) {
        desc.add(new SeatSeatdataPrice1Seatsprice3Desc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this.totalPrice;
    if (this.desc != null) {
      data['desc'] = this.desc.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeatSeatdataPrice1Seatsprice3Desc {
  String activity;
  String price;

  SeatSeatdataPrice1Seatsprice3Desc({this.activity, this.price});

  SeatSeatdataPrice1Seatsprice3Desc.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    data['price'] = this.price;
    return data;
  }
}

class SeatSeatdataPrice1Seatsprice4 {
  String totalPrice;
  List<SeatSeatdataPrice1Seatsprice4Desc> desc;

  SeatSeatdataPrice1Seatsprice4({this.totalPrice, this.desc});

  SeatSeatdataPrice1Seatsprice4.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    if (json['desc'] != null) {
      desc = new List<SeatSeatdataPrice1Seatsprice4Desc>();
      (json['desc'] as List).forEach((v) {
        desc.add(new SeatSeatdataPrice1Seatsprice4Desc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this.totalPrice;
    if (this.desc != null) {
      data['desc'] = this.desc.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeatSeatdataPrice1Seatsprice4Desc {
  String activity;
  String price;

  SeatSeatdataPrice1Seatsprice4Desc({this.activity, this.price});

  SeatSeatdataPrice1Seatsprice4Desc.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    data['price'] = this.price;
    return data;
  }
}

class SeatSeatdataPrice1Seatsprice5 {
  String totalPrice;
  List<SeatSeatdataPrice1Seatsprice5Desc> desc;

  SeatSeatdataPrice1Seatsprice5({this.totalPrice, this.desc});

  SeatSeatdataPrice1Seatsprice5.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    if (json['desc'] != null) {
      desc = new List<SeatSeatdataPrice1Seatsprice5Desc>();
      (json['desc'] as List).forEach((v) {
        desc.add(new SeatSeatdataPrice1Seatsprice5Desc.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this.totalPrice;
    if (this.desc != null) {
      data['desc'] = this.desc.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SeatSeatdataPrice1Seatsprice5Desc {
  String activity;
  String price;

  SeatSeatdataPrice1Seatsprice5Desc({this.activity, this.price});

  SeatSeatdataPrice1Seatsprice5Desc.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    data['price'] = this.price;
    return data;
  }
}

class SeatSeatdataPrice1Seatspricedetail1 {
  bool display;
  List<SeatSeatdataPrice1Seatspricedetail1Detail> detail;
  String originPrice;

  SeatSeatdataPrice1Seatspricedetail1(
      {this.display, this.detail, this.originPrice});

  SeatSeatdataPrice1Seatspricedetail1.fromJson(Map<String, dynamic> json) {
    display = json['display'];
    if (json['detail'] != null) {
      detail = new List<SeatSeatdataPrice1Seatspricedetail1Detail>();
      (json['detail'] as List).forEach((v) {
        detail.add(new SeatSeatdataPrice1Seatspricedetail1Detail.fromJson(v));
      });
    }
    originPrice = json['originPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display'] = this.display;
    if (this.detail != null) {
      data['detail'] = this.detail.map((v) => v.toJson()).toList();
    }
    data['originPrice'] = this.originPrice;
    return data;
  }
}

class SeatSeatdataPrice1Seatspricedetail1Detail {
  String price;
  List<Null> desc;

  SeatSeatdataPrice1Seatspricedetail1Detail({this.price, this.desc});

  SeatSeatdataPrice1Seatspricedetail1Detail.fromJson(
      Map<String, dynamic> json) {
    price = json['price'];
    if (json['desc'] != null) {
      desc = new List<Null>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    if (this.desc != null) {
      data['desc'] = [];
    }
    return data;
  }
}

class SeatSeatdataPrice1Seatspricedetail2 {
  bool display;
  List<SeatSeatdataPrice1Seatspricedetail2Detail> detail;
  String originPrice;

  SeatSeatdataPrice1Seatspricedetail2(
      {this.display, this.detail, this.originPrice});

  SeatSeatdataPrice1Seatspricedetail2.fromJson(Map<String, dynamic> json) {
    display = json['display'];
    if (json['detail'] != null) {
      detail = new List<SeatSeatdataPrice1Seatspricedetail2Detail>();
      (json['detail'] as List).forEach((v) {
        detail.add(new SeatSeatdataPrice1Seatspricedetail2Detail.fromJson(v));
      });
    }
    originPrice = json['originPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display'] = this.display;
    if (this.detail != null) {
      data['detail'] = this.detail.map((v) => v.toJson()).toList();
    }
    data['originPrice'] = this.originPrice;
    return data;
  }
}

class SeatSeatdataPrice1Seatspricedetail2Detail {
  String price;
  List<Null> desc;

  SeatSeatdataPrice1Seatspricedetail2Detail({this.price, this.desc});

  SeatSeatdataPrice1Seatspricedetail2Detail.fromJson(
      Map<String, dynamic> json) {
    price = json['price'];
    if (json['desc'] != null) {
      desc = new List<Null>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    if (this.desc != null) {
      data['desc'] = [];
    }
    return data;
  }
}

class SeatSeatdataPrice1Seatspricedetail3 {
  bool display;
  List<SeatSeatdataPrice1Seatspricedetail3Detail> detail;
  String originPrice;

  SeatSeatdataPrice1Seatspricedetail3(
      {this.display, this.detail, this.originPrice});

  SeatSeatdataPrice1Seatspricedetail3.fromJson(Map<String, dynamic> json) {
    display = json['display'];
    if (json['detail'] != null) {
      detail = new List<SeatSeatdataPrice1Seatspricedetail3Detail>();
      (json['detail'] as List).forEach((v) {
        detail.add(new SeatSeatdataPrice1Seatspricedetail3Detail.fromJson(v));
      });
    }
    originPrice = json['originPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display'] = this.display;
    if (this.detail != null) {
      data['detail'] = this.detail.map((v) => v.toJson()).toList();
    }
    data['originPrice'] = this.originPrice;
    return data;
  }
}

class SeatSeatdataPrice1Seatspricedetail3Detail {
  String price;
  List<Null> desc;

  SeatSeatdataPrice1Seatspricedetail3Detail({this.price, this.desc});

  SeatSeatdataPrice1Seatspricedetail3Detail.fromJson(
      Map<String, dynamic> json) {
    price = json['price'];
    if (json['desc'] != null) {
      desc = new List<Null>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    if (this.desc != null) {
      data['desc'] = [];
    }
    return data;
  }
}

class SeatSeatdataPrice1Seatspricedetail4 {
  bool display;
  List<SeatSeatdataPrice1Seatspricedetail4Detail> detail;
  String originPrice;

  SeatSeatdataPrice1Seatspricedetail4(
      {this.display, this.detail, this.originPrice});

  SeatSeatdataPrice1Seatspricedetail4.fromJson(Map<String, dynamic> json) {
    display = json['display'];
    if (json['detail'] != null) {
      detail = new List<SeatSeatdataPrice1Seatspricedetail4Detail>();
      (json['detail'] as List).forEach((v) {
        detail.add(new SeatSeatdataPrice1Seatspricedetail4Detail.fromJson(v));
      });
    }
    originPrice = json['originPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display'] = this.display;
    if (this.detail != null) {
      data['detail'] = this.detail.map((v) => v.toJson()).toList();
    }
    data['originPrice'] = this.originPrice;
    return data;
  }
}

class SeatSeatdataPrice1Seatspricedetail4Detail {
  String price;
  List<Null> desc;

  SeatSeatdataPrice1Seatspricedetail4Detail({this.price, this.desc});

  SeatSeatdataPrice1Seatspricedetail4Detail.fromJson(
      Map<String, dynamic> json) {
    price = json['price'];
    if (json['desc'] != null) {
      desc = new List<Null>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    if (this.desc != null) {
      data['desc'] = [];
    }
    return data;
  }
}

class SeatSeatdataPrice1Seatspricedetail5 {
  bool display;
  List<SeatSeatdataPrice1Seatspricedetail5Detail> detail;
  String originPrice;

  SeatSeatdataPrice1Seatspricedetail5(
      {this.display, this.detail, this.originPrice});

  SeatSeatdataPrice1Seatspricedetail5.fromJson(Map<String, dynamic> json) {
    display = json['display'];
    if (json['detail'] != null) {
      detail = new List<SeatSeatdataPrice1Seatspricedetail5Detail>();
      (json['detail'] as List).forEach((v) {
        detail.add(new SeatSeatdataPrice1Seatspricedetail5Detail.fromJson(v));
      });
    }
    originPrice = json['originPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display'] = this.display;
    if (this.detail != null) {
      data['detail'] = this.detail.map((v) => v.toJson()).toList();
    }
    data['originPrice'] = this.originPrice;
    return data;
  }
}

class SeatSeatdataPrice1Seatspricedetail5Detail {
  String price;
  List<Null> desc;

  SeatSeatdataPrice1Seatspricedetail5Detail({this.price, this.desc});

  SeatSeatdataPrice1Seatspricedetail5Detail.fromJson(
      Map<String, dynamic> json) {
    price = json['price'];
    if (json['desc'] != null) {
      desc = new List<Null>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    if (this.desc != null) {
      data['desc'] = [];
    }
    return data;
  }
}

class SeatSeatdataShow {
  int langWarn;
  int buyNumLimit;
  int showId;
  String watermark;
  String seqNo;
  dynamic adReport;
  String showTime;
  String dim;
  String lang;
  String showDate;

  SeatSeatdataShow(
      {this.langWarn,
      this.buyNumLimit,
      this.showId,
      this.watermark,
      this.seqNo,
      this.adReport,
      this.showTime,
      this.dim,
      this.lang,
      this.showDate});

  SeatSeatdataShow.fromJson(Map<String, dynamic> json) {
    langWarn = json['langWarn'];
    buyNumLimit = json['buyNumLimit'];
    showId = json['showId'];
    watermark = json['watermark'];
    seqNo = json['seqNo'];
    adReport = json['adReport'];
    showTime = json['showTime'];
    dim = json['dim'];
    lang = json['lang'];
    showDate = json['showDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['langWarn'] = this.langWarn;
    data['buyNumLimit'] = this.buyNumLimit;
    data['showId'] = this.showId;
    data['watermark'] = this.watermark;
    data['seqNo'] = this.seqNo;
    data['adReport'] = this.adReport;
    data['showTime'] = this.showTime;
    data['dim'] = this.dim;
    data['lang'] = this.lang;
    data['showDate'] = this.showDate;
    return data;
  }
}

class SeatSeatdataHall {
  int hallId;
  String hallName;

  SeatSeatdataHall({this.hallId, this.hallName});

  SeatSeatdataHall.fromJson(Map<String, dynamic> json) {
    hallId = json['hallId'];
    hallName = json['hallName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hallId'] = this.hallId;
    data['hallName'] = this.hallName;
    return data;
  }
}

class SeatSeatdataCinema {
  int cinemaId;
  String cinemaName;

  SeatSeatdataCinema({this.cinemaId, this.cinemaName});

  SeatSeatdataCinema.fromJson(Map<String, dynamic> json) {
    cinemaId = json['cinemaId'];
    cinemaName = json['cinemaName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cinemaId'] = this.cinemaId;
    data['cinemaName'] = this.cinemaName;
    return data;
  }
}

class SeatSeatdataUser {
  int mobileSourceType;
  String userPhone;

  SeatSeatdataUser({this.mobileSourceType, this.userPhone});

  SeatSeatdataUser.fromJson(Map<String, dynamic> json) {
    mobileSourceType = json['mobileSourceType'];
    userPhone = json['userPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileSourceType'] = this.mobileSourceType;
    data['userPhone'] = this.userPhone;
    return data;
  }
}
