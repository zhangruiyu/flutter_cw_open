import 'package:chongmeng/function/adoption/my_adoption/model/my_adoption_entity.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

enum AdoptionBackendAction {
  add, //添加
  amend, //修改
}

class AdoptionAddState implements Cloneable<AdoptionAddState> {
  //操作类型
  AdoptionBackendAction adoptionAction;

  //如果是从我的领养进来的 那么会有这个信息 作为提交时候比对
  MyAdoptionDataAdoption localAdoption;
  List<UploadTask> selectPicList;

  //宠物大类型id
  int petTypeId;

  //宠物子类型子
  int petSubTypeId;
  TextEditingController petTypeIdTextEditingController;

  //性别
  int sex;
  TextEditingController sexTextEditingController;

  //是否驱虫
  int isExpellingParasite;
  TextEditingController isExpellingParasiteTextEditingController;

//是否绝育
  int isSterilization;
  TextEditingController isSterilizationTextEditingController;

//是否免疫疫苗
  int isImmune;
  TextEditingController isImmuneTextEditingController;

  //宠物名字
  TextEditingController petNameTextEditingController;

  //描述
  TextEditingController descriptionTextEditingController;

  //年龄
  TextEditingController ageTextEditingController;

  //领养要求
  TextEditingController requestTextEditingController;

  //送养人名字
  TextEditingController masterNameTextEditingController;

  //城市
  Result city;
  TextEditingController cityTextEditingController;

  //0 无偿 1 押金 2有偿
  int adoptionType;

  //押金
  TextEditingController cashPledgeTextEditingController;

  //押金退还期限
  TextEditingController cashPledgeDeadlineTextEditingController;

  //有偿
  TextEditingController moneyPledgeTextEditingController;

  @override
  AdoptionAddState clone() {
    return AdoptionAddState()
      ..adoptionAction = adoptionAction
      ..localAdoption = localAdoption
      ..petSubTypeId = petSubTypeId
      ..adoptionType = adoptionType
      ..selectPicList = selectPicList
      ..petTypeId = petTypeId
      ..sex = sex
      ..isExpellingParasite = isExpellingParasite
      ..isSterilization = isSterilization
      ..isImmune = isImmune
      ..city = city
      ..cashPledgeDeadlineTextEditingController =
          cashPledgeDeadlineTextEditingController
      ..moneyPledgeTextEditingController = moneyPledgeTextEditingController
      ..cashPledgeTextEditingController = cashPledgeTextEditingController
      ..petTypeIdTextEditingController = petTypeIdTextEditingController
      ..sexTextEditingController = sexTextEditingController
      ..ageTextEditingController = ageTextEditingController
      ..isExpellingParasiteTextEditingController =
          isExpellingParasiteTextEditingController
      ..isSterilizationTextEditingController =
          isSterilizationTextEditingController
      ..isImmuneTextEditingController = isImmuneTextEditingController
      ..petNameTextEditingController = petNameTextEditingController
      ..requestTextEditingController = requestTextEditingController
      ..masterNameTextEditingController = masterNameTextEditingController
      ..cityTextEditingController = cityTextEditingController
      ..descriptionTextEditingController = descriptionTextEditingController;
  }
}

AdoptionAddState initState(Map<String, dynamic> args) {
  var adoptionAddState = AdoptionAddState();
  adoptionAddState
    ..adoptionAction = args['adoptionAction']
    ..localAdoption = args['localAdoption'];
  adoptionAddState
    ..adoptionType = 0
    ..cashPledgeDeadlineTextEditingController = TextEditingController()
    ..moneyPledgeTextEditingController = TextEditingController()
    ..cashPledgeTextEditingController = TextEditingController()
    ..isExpellingParasiteTextEditingController = TextEditingController()
    ..isSterilizationTextEditingController = TextEditingController()
    ..isImmuneTextEditingController = TextEditingController()
    ..petTypeIdTextEditingController = TextEditingController()
    ..petNameTextEditingController = TextEditingController()
    ..sexTextEditingController = TextEditingController()
    ..ageTextEditingController = TextEditingController()
    ..requestTextEditingController = TextEditingController()
    ..masterNameTextEditingController = TextEditingController()
    ..cityTextEditingController = TextEditingController()
    ..descriptionTextEditingController = TextEditingController();
  if (adoptionAddState.adoptionAction == AdoptionBackendAction.amend &&
      adoptionAddState.localAdoption != null) {
    var localAdoption = adoptionAddState.localAdoption;
    adoptionAddState.petTypeIdTextEditingController.text =
        localAdoption.petTypeName;
    adoptionAddState.petNameTextEditingController.text = localAdoption.petName;
    adoptionAddState.sexTextEditingController.text =
        localAdoption.sex == 1 ? "公" : "母";
    adoptionAddState.ageTextEditingController.text =
        localAdoption.age.replaceAll("个月", "");
//    adoptionAddState.ageTextEditingController.text =
    ////0 无偿 1 押金 2有偿
    adoptionAddState.adoptionType = localAdoption.adoptionType;
    if (localAdoption.adoptionType == 1) {
      adoptionAddState.cashPledgeTextEditingController.text =
          localAdoption.money.toString();
      adoptionAddState.cashPledgeDeadlineTextEditingController.text =
          localAdoption.cashPledgeDeadline.toString();
    } else if (localAdoption.adoptionType == 2) {
      adoptionAddState.moneyPledgeTextEditingController.text =
          localAdoption.money.toString();
    }
    //是否驱虫
    adoptionAddState.isExpellingParasiteTextEditingController.text =
        localAdoption.isExpellingParasite ? "已驱虫" : "未驱虫";

//是否绝育
    adoptionAddState.isSterilizationTextEditingController.text =
        localAdoption.isSterilization ? "已绝育" : "未绝育";

//是否免疫疫苗
    adoptionAddState.isImmuneTextEditingController.text =
        localAdoption.isImmune ? "已免疫" : "未免疫";

    //描述
    adoptionAddState.descriptionTextEditingController.text =
        localAdoption.description;

    //领养要求
    adoptionAddState.requestTextEditingController.text = localAdoption.request;
    //送养人名字
    adoptionAddState.masterNameTextEditingController.text =
        localAdoption.masterName;
    adoptionAddState.cityTextEditingController.text =
        localAdoption.provincename +
            localAdoption.cityname +
            localAdoption.areaname;
  }
  return adoptionAddState;
}
