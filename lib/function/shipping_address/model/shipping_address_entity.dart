class ShippingAddressEntity {
  String msg;
  List<ShippingAddressData> data;
  int status;

  ShippingAddressEntity({this.msg, this.data, this.status});

  ShippingAddressEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<ShippingAddressData>();
      (json['data'] as List).forEach((v) {
        data.add(new ShippingAddressData.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class ShippingAddressData {
  String consignee;
  String createTime;
  String areaname;
  String cityname;
  int cityid;
  int provinceid;
  int areaid;
  int userId;
  String provincename;
  String addressDetails;
  String tel;
  int id;
  int cityId;

  ShippingAddressData(
      {this.consignee,
      this.createTime,
      this.areaname,
      this.cityname,
      this.cityid,
      this.provinceid,
      this.areaid,
      this.userId,
      this.provincename,
      this.addressDetails,
      this.tel,
      this.id,
      this.cityId});

  ShippingAddressData.fromJson(Map<String, dynamic> json) {
    consignee = json['consignee'];
    createTime = json['create_time'];
    areaname = json['areaname'];
    cityname = json['cityname'];
    cityid = json['cityid'];
    provinceid = json['provinceid'];
    areaid = json['areaid'];
    userId = json['user_id'];
    provincename = json['provincename'];
    addressDetails = json['address_details'];
    tel = json['tel'];
    id = json['id'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consignee'] = this.consignee;
    data['create_time'] = this.createTime;
    data['areaname'] = this.areaname;
    data['cityname'] = this.cityname;
    data['cityid'] = this.cityid;
    data['provinceid'] = this.provinceid;
    data['areaid'] = this.areaid;
    data['user_id'] = this.userId;
    data['provincename'] = this.provincename;
    data['address_details'] = this.addressDetails;
    data['tel'] = this.tel;
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    return data;
  }
}
