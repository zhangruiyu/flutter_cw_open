class MyOrderEntity {
  String msg;
  MyOrderData data;
  int status;

  MyOrderEntity({this.msg, this.data, this.status});

  MyOrderEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new MyOrderData.fromJson(json['data']) : null;
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

class MyOrderData {
  List<MyOrderDataStoreorder> storeOrder;
  List<MyOrderDataMovieorder> movieOrder;

  MyOrderData({this.storeOrder, this.movieOrder});

  MyOrderData.fromJson(Map<String, dynamic> json) {
    if (json['storeOrder'] != null) {
      storeOrder = new List<MyOrderDataStoreorder>();
      (json['storeOrder'] as List).forEach((v) {
        storeOrder.add(new MyOrderDataStoreorder.fromJson(v));
      });
    }
    if (json['movieOrder'] != null) {
      movieOrder = new List<MyOrderDataMovieorder>();
      (json['movieOrder'] as List).forEach((v) {
        movieOrder.add(new MyOrderDataMovieorder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.storeOrder != null) {
      data['storeOrder'] = this.storeOrder.map((v) => v.toJson()).toList();
    }
    if (this.movieOrder != null) {
      data['movieOrder'] = this.movieOrder.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyOrderDataStoreorder {
  String createTime;
  String consigneeName;
  int count;
  String sourceType;
  List<String> pic;
  String remake;
  String type;
  String addressDetail;
  List<MyOrderDataStoreorderVirtualProduct> virtualProduct;
  int integral;
  String name;
  int productType;
  String tel;
  int id;
  dynamic expressNumber;
  int status;
  dynamic expressType;
  String externalRemake;

  MyOrderDataStoreorder(
      {this.createTime,
      this.consigneeName,
      this.count,
      this.sourceType,
      this.pic,
      this.remake,
      this.type,
      this.addressDetail,
      this.virtualProduct,
      this.integral,
      this.name,
      this.tel,
      this.id,
      this.expressNumber,
      this.status,
      this.expressType,
      this.externalRemake});

  MyOrderDataStoreorder.fromJson(Map<String, dynamic> json) {
    createTime = json['create_time'];
    consigneeName = json['consignee_name'];
    count = json['count'];
    sourceType = json['source_type'];
    pic = json['pic']?.cast<String>();
    remake = json['remake'];
    type = json['type'];
    addressDetail = json['address_detail'];
    if (json['virtual_product'] != null) {
      virtualProduct = new List<MyOrderDataStoreorderVirtualProduct>();
      (json['virtual_product'] as List).forEach((v) {
        virtualProduct.add(new MyOrderDataStoreorderVirtualProduct.fromJson(v));
      });
    }
    integral = json['integral'];
    name = json['name'];
    tel = json['tel'];
    id = json['id'];
    expressNumber = json['express_number'];
    status = json['status'];
    expressType = json['express_type'];
    externalRemake = json['external_remake'];
    productType = json['product_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_time'] = this.createTime;
    data['consignee_name'] = this.consigneeName;
    data['count'] = this.count;
    data['source_type'] = this.sourceType;
    data['pic'] = this.pic;
    data['remake'] = this.remake;
    data['type'] = this.type;
    data['address_detail'] = this.addressDetail;
    if (this.virtualProduct != null) {
      data['virtual_product'] =
          this.virtualProduct.map((v) => v.toJson()).toList();
    }
    data['integral'] = this.integral;
    data['name'] = this.name;
    data['tel'] = this.tel;
    data['id'] = this.id;
    data['express_number'] = this.expressNumber;
    data['status'] = this.status;
    data['express_type'] = this.expressType;
    data['external_remake'] = this.externalRemake;
    data['product_type'] = this.productType;
    return data;
  }
}

class MyOrderDataStoreorderVirtualProduct {
  String invalidTime;
  String virtualProductRepertoryStatus;
  String content;
  String convertTime;

  MyOrderDataStoreorderVirtualProduct(
      {this.invalidTime,
      this.virtualProductRepertoryStatus,
      this.content,
      this.convertTime});

  MyOrderDataStoreorderVirtualProduct.fromJson(Map<String, dynamic> json) {
    invalidTime = json['invalid_time'];
    virtualProductRepertoryStatus = json['virtual_product_repertory_status'];
    content = json['content'];
    convertTime = json['convert_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invalid_time'] = this.invalidTime;
    data['virtual_product_repertory_status'] =
        this.virtualProductRepertoryStatus;
    data['content'] = this.content;
    data['convert_time'] = this.convertTime;
    return data;
  }
}

class MyOrderDataMovieorder {
  List<MyOrderDataMovieorderMovieSeat> movieSeat;
  String showTime;
  String lng;
  String createTime;
  int itemPrice;
  String consigneeName;
  String hall;
  String dim;
  String movieName;
  List<dynamic> remake;
  List<String> content;
  String addressDetail;
  int totalPay;
  int movieDuration;
  String cinemaName;
  String showDate;
  String movieImg;
  String tel;
  String cinemaAddr;
  String lang;
  String lat;
  int status;

  int productType;

  MyOrderDataMovieorder(
      {this.movieSeat,
      this.showTime,
      this.lng,
      this.createTime,
      this.itemPrice,
      this.consigneeName,
      this.hall,
      this.dim,
      this.movieName,
      this.content,
      this.addressDetail,
      this.totalPay,
      this.movieDuration,
      this.cinemaName,
      this.showDate,
      this.movieImg,
      this.tel,
      this.cinemaAddr,
      this.lang,
      this.lat,
      this.status});

  MyOrderDataMovieorder.fromJson(Map<String, dynamic> json) {
    if (json['movie_seat'] != null) {
      movieSeat = new List<MyOrderDataMovieorderMovieSeat>();
      (json['movie_seat'] as List).forEach((v) {
        movieSeat.add(new MyOrderDataMovieorderMovieSeat.fromJson(v));
      });
    }
    showTime = json['show_time'];
    lng = json['lng'];
    createTime = json['create_time'];
    itemPrice = json['item_price'];
    consigneeName = json['consignee_name'];
    hall = json['hall'];
    dim = json['dim'];
    movieName = json['movie_name'];
    content = json['content']?.cast<String>();
    addressDetail = json['address_detail'];
    totalPay = json['total_pay'];
    movieDuration = json['movie_duration'];
    cinemaName = json['cinema_name'];
    showDate = json['show_date'];
    movieImg = json['movie_img'];
    tel = json['tel'];
    cinemaAddr = json['cinema_addr'];
    lang = json['lang'];
    lat = json['lat'];
    status = json['status'];
    remake = json['remake'];
    productType = json['product_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movieSeat != null) {
      data['movie_seat'] = this.movieSeat.map((v) => v.toJson()).toList();
    }
    data['show_time'] = this.showTime;
    data['lng'] = this.lng;
    data['create_time'] = this.createTime;
    data['item_price'] = this.itemPrice;
    data['consignee_name'] = this.consigneeName;
    data['hall'] = this.hall;
    data['dim'] = this.dim;
    data['movie_name'] = this.movieName;
    data['content'] = this.content;
    data['address_detail'] = this.addressDetail;
    data['total_pay'] = this.totalPay;
    data['movie_duration'] = this.movieDuration;
    data['cinema_name'] = this.cinemaName;
    data['show_date'] = this.showDate;
    data['movie_img'] = this.movieImg;
    data['tel'] = this.tel;
    data['cinema_addr'] = this.cinemaAddr;
    data['lang'] = this.lang;
    data['lat'] = this.lat;
    data['status'] = this.status;
    data['remake'] = this.remake;
    data['product_type'] = this.productType;
    return data;
  }
}

class MyOrderDataMovieorderMovieSeat {
  String columnId;
  String rowId;

  MyOrderDataMovieorderMovieSeat({this.columnId, this.rowId});

  MyOrderDataMovieorderMovieSeat.fromJson(Map<String, dynamic> json) {
    columnId = json['columnId'];
    rowId = json['rowId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columnId'] = this.columnId;
    data['rowId'] = this.rowId;
    return data;
  }
}
