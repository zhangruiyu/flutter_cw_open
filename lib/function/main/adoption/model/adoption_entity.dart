class AdoptionEntity {
  String msg;
  AdoptionData data;
  int status;

  AdoptionEntity({this.msg, this.data, this.status});

  AdoptionEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data =
        json['data'] != null ? new AdoptionData.fromJson(json['data']) : null;
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

class AdoptionData {
  String image;
  List<AdoptionDataAdoption> adoption;

  AdoptionData({this.image, this.adoption});

  AdoptionData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    if (json['adoption'] != null) {
      adoption = new List<AdoptionDataAdoption>();
      (json['adoption'] as List).forEach((v) {
        adoption.add(new AdoptionDataAdoption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    if (this.adoption != null) {
      data['adoption'] = this.adoption.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdoptionDataAdoption {
  String request;
  String createTime;
  String areaname;
  int sex;
  String cityname;
  String description;
  bool isSterilization;
  List<String> pic;
  String cashPledgeDeadline;
  int adoptionType;
  String petTypeName;
  String masterName;
  bool isImmune;
  String petName;
  int money;
  int userId;
  String provincename;
  int subTypeId;
  bool isExpellingParasite;
  int id;
  String age;
  int status;

  AdoptionDataAdoption(
      {this.request,
      this.createTime,
      this.areaname,
      this.sex,
      this.cityname,
      this.description,
      this.isSterilization,
      this.pic,
      this.cashPledgeDeadline,
      this.adoptionType,
      this.petTypeName,
      this.masterName,
      this.isImmune,
      this.petName,
      this.money,
      this.userId,
      this.provincename,
      this.subTypeId,
      this.isExpellingParasite,
      this.id,
      this.age,
      this.status});

  AdoptionDataAdoption.fromJson(Map<String, dynamic> json) {
    request = json['request'];
    createTime = json['create_time'];
    areaname = json['areaname'];
    sex = json['sex'];
    cityname = json['cityname'];
    description = json['description'];
    isSterilization = json['is_sterilization'];
    pic = json['pic']?.cast<String>();
    cashPledgeDeadline = json['cash_pledge_deadline'];
    adoptionType = json['adoption_type'];
    petTypeName = json['pet_type_name'];
    masterName = json['master_name'];
    isImmune = json['is_immune'];
    petName = json['pet_name'];
    money = json['money'];
    userId = json['user_id'];
    provincename = json['provincename'];
    subTypeId = json['sub_type_id'];
    isExpellingParasite = json['is_expelling_parasite'];
    id = json['id'];
    age = json['age'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request'] = this.request;
    data['create_time'] = this.createTime;
    data['areaname'] = this.areaname;
    data['sex'] = this.sex;
    data['cityname'] = this.cityname;
    data['description'] = this.description;
    data['is_sterilization'] = this.isSterilization;
    data['pic'] = this.pic;
    data['cash_pledge_deadline'] = this.cashPledgeDeadline;
    data['adoption_type'] = this.adoptionType;
    data['pet_type_name'] = this.petTypeName;
    data['master_name'] = this.masterName;
    data['is_immune'] = this.isImmune;
    data['pet_name'] = this.petName;
    data['money'] = this.money;
    data['user_id'] = this.userId;
    data['provincename'] = this.provincename;
    data['sub_type_id'] = this.subTypeId;
    data['is_expelling_parasite'] = this.isExpellingParasite;
    data['id'] = this.id;
    data['age'] = this.age;
    data['status'] = this.status;
    return data;
  }
}
