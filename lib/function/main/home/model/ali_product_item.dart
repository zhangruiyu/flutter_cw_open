class AliProductItem {
  String volume;
  String couponClickUrl;
  List<String> smallImages;
  String pictUrl;
  String title;
  String zkFinalPriceWap;
  String favourablePrice;
  String couponValue;
  String couponStartTime;
  String couponEndTime;
  String productId;
  String type;
  String itemUrl;

  AliProductItem(
      {this.volume,
      this.couponClickUrl,
      this.smallImages,
      this.pictUrl,
      this.title,
      this.zkFinalPriceWap,
      this.favourablePrice,
      this.couponValue});

  AliProductItem.fromJson(Map<String, dynamic> json) {
    volume = json['volume'];
    couponClickUrl = json['coupon_click_url'];
    smallImages = json['small_images']?.cast<String>();
    pictUrl = json['pict_url'];
    title = json['title'];
    zkFinalPriceWap = json['zk_final_price_wap'];
    favourablePrice = json['favourable_price'];
    couponValue = json['coupon_value'];
    couponStartTime = json['coupon_start_time'];
    couponEndTime = json['coupon_end_time'];
    productId = json['product_id'];
    type = json['type'];
    itemUrl = json['item_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['volume'] = this.volume;
    data['coupon_click_url'] = this.couponClickUrl;
    data['small_images'] = this.smallImages;
    data['pict_url'] = this.pictUrl;
    data['title'] = this.title;
    data['zk_final_price_wap'] = this.zkFinalPriceWap;
    data['favourable_price'] = this.favourablePrice;
    data['coupon_value'] = this.couponValue;
    data['coupon_start_time'] = this.couponStartTime;
    data['coupon_end_time'] = this.couponEndTime;
    data['product_id'] = this.productId;
    data['type'] = this.type;
    data['item_url'] = this.itemUrl;
    return data;
  }
}
