class MyAdoptionEntity {
  String msg;
  MyAdoptionData data;
  int status;

  MyAdoptionEntity({this.msg, this.data, this.status});

  MyAdoptionEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data =
        json['data'] != null ? new MyAdoptionData.fromJson(json['data']) : null;
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

class MyAdoptionData {
  String image;
  List<MyAdoptionDataAdoption> adoption;

  MyAdoptionData({this.image, this.adoption});

  MyAdoptionData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    if (json['adoption'] != null) {
      adoption = new List<MyAdoptionDataAdoption>();
      (json['adoption'] as List).forEach((v) {
        adoption.add(new MyAdoptionDataAdoption.fromJson(v));
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

class MyAdoptionDataAdoption {
  int petTypeId;
  String request;
  String createTime;
  String areaname;
  int sex;
  String cityname;
  String description;
  bool isSterilization;
  List<String> pic;
  String petTypeName;
  String masterName;
  int adoptionType;
  int money;
  int cashPledgeDeadline;
  bool isImmune;
  String petName;
  int userId;
  String provincename;
  dynamic subTypeId;
  bool isExpellingParasite;
  int id;
  String age;
  int status;

  MyAdoptionDataAdoption(
      {this.petTypeId,
      this.request,
      this.createTime,
      this.areaname,
      this.sex,
      this.cityname,
      this.description,
      this.isSterilization,
      this.pic,
      this.petTypeName,
      this.masterName,
      this.isImmune,
      this.petName,
      this.userId,
      this.provincename,
      this.subTypeId,
      this.isExpellingParasite,
      this.id,
      this.age,
      this.status});

  MyAdoptionDataAdoption.fromJson(Map<String, dynamic> json) {
    petTypeId = json['pet_type_id'];
    request = json['request'];
    createTime = json['create_time'];
    areaname = json['areaname'];
    sex = json['sex'];
    cityname = json['cityname'];
    description = json['description'];
    isSterilization = json['is_sterilization'];
    pic = json['pic']?.cast<String>();
    petTypeName = json['pet_type_name'];
    masterName = json['master_name'];
    isImmune = json['is_immune'];
    petName = json['pet_name'];
    userId = json['user_id'];
    provincename = json['provincename'];
    subTypeId = json['sub_type_id'];
    isExpellingParasite = json['is_expelling_parasite'];
    id = json['id'];
    age = json['age'];
    status = json['status'];
    adoptionType = json['adoption_type'];
    money = json['money'];
    cashPledgeDeadline = json['cash_pledge_deadline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pet_type_id'] = this.petTypeId;
    data['request'] = this.request;
    data['create_time'] = this.createTime;
    data['areaname'] = this.areaname;
    data['sex'] = this.sex;
    data['cityname'] = this.cityname;
    data['description'] = this.description;
    data['is_sterilization'] = this.isSterilization;
    data['pic'] = this.pic;
    data['pet_type_name'] = this.petTypeName;
    data['master_name'] = this.masterName;
    data['is_immune'] = this.isImmune;
    data['pet_name'] = this.petName;
    data['user_id'] = this.userId;
    data['provincename'] = this.provincename;
    data['sub_type_id'] = this.subTypeId;
    data['is_expelling_parasite'] = this.isExpellingParasite;
    data['id'] = this.id;
    data['age'] = this.age;
    data['status'] = this.status;
    data['adoption_type'] = this.adoptionType;
    data['money'] = this.money;
    data['cash_pledge_deadline'] = this.cashPledgeDeadline;
    return data;
  }
}
