class MovieOrderEntity {
  String msg;
  MovieOrderData data;
  int status;

  MovieOrderEntity({this.msg, this.data, this.status});

  MovieOrderEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data =
        json['data'] != null ? new MovieOrderData.fromJson(json['data']) : null;
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

class MovieOrderData {
  int totalPay;
  String originalPrice;
  int discountPrice;
  var discountPriceRmb;
  var totalDiscountPriceRmb;
  var totalDiscountPrice;
  var totalUserIntegral;
  var movieDiscount;

  MovieOrderData(
      {this.totalPay,
      this.originalPrice,
      this.discountPrice,
      this.discountPriceRmb,
      this.totalDiscountPriceRmb,
      this.totalDiscountPrice});

  MovieOrderData.fromJson(Map<String, dynamic> json) {
    totalPay = json['totalPay'];
    originalPrice = json['originalPrice'];
    discountPrice = json['discountPrice'];
    discountPriceRmb = json['discountPriceRmb'];
    totalDiscountPriceRmb = json['totalDiscountPriceRmb'];
    totalDiscountPrice = json['totalDiscountPrice'];
    totalUserIntegral = json['totalUserIntegral'];
    movieDiscount = json['movieDiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPay'] = this.totalPay;
    data['originalPrice'] = this.originalPrice;
    data['discountPrice'] = this.discountPrice;
    data['discountPriceRmb'] = this.discountPriceRmb;
    data['totalDiscountPriceRmb'] = this.totalDiscountPriceRmb;
    data['totalDiscountPrice'] = this.totalDiscountPrice;
    data['totalUserIntegral'] = this.totalUserIntegral;
    data['movieDiscount'] = this.movieDiscount;
    return data;
  }
}
