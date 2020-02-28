import 'dart:convert';

import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/function/my_pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/network/net_work.dart' as netWork;
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/widget/select_bottom.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

Effect<AdoptionAddState> buildEffect() {
  return combineEffects(<Object, Effect<AdoptionAddState>>{
    AdoptionAddAction.ReselectPic: _onReselectPic,
    AdoptionAddAction.Commit: _onCommit,
    AdoptionAddAction.SelectType: _onSelectType,
  });
}

void _onSelectType(Action action, Context<AdoptionAddState> ctx) async {
  String type = action.payload;
  Map<String, dynamic> selectResult;

  if (type == "cityCode") {
    var cityResult = (await CityPickers.showCityPicker(
      context: ctx.context,
    ));
    selectResult = {
      'key':
          cityResult.provinceName + cityResult.cityName + cityResult.areaName,
      'value': cityResult
    };
  } else {
    Map<String, dynamic> params;
    if (type == "petTypeId") {
      var result = await RequestClient.request<PetTypeEntity>(
          ctx.context, HttpConstants.PetType);
      if (result.hasSuccess) {
        /*params = {}
          ..addEntries(result.data.data.map<MapEntry<String, dynamic>>((item) {
            return MapEntry(item.name, item.id);
          }));
*/
        var petTypeEntity = await RequestClient.request<PetTypeEntity>(
            ctx.context, HttpConstants.PetType);
        if (petTypeEntity.hasSuccess) {
          Map<String, dynamic> result = (await Navigator.pushNamed(
                  ctx.context, PageConstants.SelectTypePage,
                  arguments: {'petTypeEntity': petTypeEntity.data.data}))
              as Map<String, dynamic>;
          if (result != null) {
            result['type'] = type;
            ctx.dispatch(AdoptionAddActionCreator.onSetType(result));
          }
        }
      }
      //品种选择自行处理,不继续往下走
      return;
    } else if (type == "sex") {
      params = {"公": 1, "母": 0};
    } else if (type == "isExpellingParasite") {
      params = {"已驱虫": 1, "未驱虫": 0};
    } else if (type == "isSterilization") {
      params = {"已绝育": 1, "未绝育": 0};
    } else if (type == "isImmune") {
      params = {"已免疫": 1, "未免疫": 0};
    }
    selectResult = await showModalBottomSheet(
        context: ctx.context,
        builder: (c) {
          return SelectBottom(
            params: params,
          );
        });
  }

  selectResult['type'] = type;
  ctx.dispatch(AdoptionAddActionCreator.onSetType(selectResult));
}

Future _onCommit(Action action, Context<AdoptionAddState> ctx) async {
  if (ctx.state.adoptionAction == AdoptionBackendAction.add) {
    //添加
    commitAdd(action, ctx);
  } else {
    //修改
    commitAmend(action, ctx);
  }
}

Future commitAmend(Action action, Context<AdoptionAddState> ctx) async {
  var state = ctx.state;
  var localAdoption = ctx.state.localAdoption;
  Map<String, dynamic> params = {'adoptionId': localAdoption.id};
  if (state.petNameTextEditingController.text != localAdoption.petName) {
    params['petName'] = state.petNameTextEditingController.text;
  }
  if (state.petSubTypeId != null &&
      state.petTypeIdTextEditingController.text != localAdoption.petTypeName) {
    params['petTypeId'] = state.petTypeId;
    params['petSubTypeId'] = state.petSubTypeId;
  }
  if (state.sex != localAdoption.sex && state.sex != null) {
    params['sex'] = state.sex;
  }
  if (state.ageTextEditingController.text !=
      localAdoption.age.replaceAll("个月", "")) {
    params['age'] = state.ageTextEditingController.text;
  }
  //是否修改了
  bool isChangeAdoptionType;
  if (state.adoptionType == localAdoption.adoptionType) {
    if (state.adoptionType == 1) {
      isChangeAdoptionType = state.cashPledgeTextEditingController.text !=
              localAdoption.money.toString() ||
          state.cashPledgeDeadlineTextEditingController.text !=
              localAdoption.cashPledgeDeadline.toString();
    } else if (state.adoptionType == 2) {
      isChangeAdoptionType = state.moneyPledgeTextEditingController.text !=
          localAdoption.money.toString();
    } else {
      //为0 说明免费 没变
      isChangeAdoptionType = false;
    }
  } else {
    isChangeAdoptionType = true;
  }
  if (isChangeAdoptionType) {
    //押金
    if (ctx.state.adoptionType == 1) {
      params["money"] = ctx.state.cashPledgeTextEditingController.text;
      params["deadLine"] =
          ctx.state.cashPledgeDeadlineTextEditingController.text;
    } else if (ctx.state.adoptionType == 2) {
      params["money"] = ctx.state.moneyPledgeTextEditingController.text;
    }
    params['adoptionType'] = state.adoptionType;
  }

  if ((state.isExpellingParasite == 1) != localAdoption.isExpellingParasite &&
      state.isExpellingParasite != null) {
    params['isExpellingParasite'] = state.isExpellingParasite;
  }
  if ((state.isSterilization == 1) != localAdoption.isSterilization &&
      state.isSterilization != null) {
    params['isSterilization'] = state.isSterilization;
  }
  if ((state.isImmune == 1) != localAdoption.isImmune &&
      state.isImmune != null) {
    params['isImmune'] = state.isImmune;
  }

  if (state.descriptionTextEditingController.text !=
      localAdoption.description) {
    params['description'] = state.descriptionTextEditingController.text;
  }
  if (state.requestTextEditingController.text != localAdoption.request) {
    params['request'] = state.requestTextEditingController.text;
  }
  if (state.masterNameTextEditingController.text != localAdoption.masterName) {
    params['masterName'] = state.masterNameTextEditingController.text;
  }

  if (state.cityTextEditingController.text !=
      (localAdoption.provincename +
          localAdoption.cityname +
          localAdoption.areaname)) {
    params['provinceId'] = state.city.provinceId;
    params['cityId'] = state.city.cityId;
    params['areaId'] = state.city.areaId;
  }
  // length 1是默认的值id
  if (ctx.state.selectPicList == null && params.length == 1) {
    showToast("必须修改其中一项");
  } else {
    //有图片就上传图片
    try {
      NavigatorHelper.showLoadingDialog(ctx.context, true);
      if (ctx.state.selectPicList?.isNotEmpty == true) {
        var cosEntity = await RequestClient.request<CosEntity>(
            ctx.context, HttpConstants.PeriodEffectiveSign,
            queryParameters: {'type': CosType.Adoption_TYPE});
        if (cosEntity.hasSuccess) {
          await Future.wait(
              ctx.state.selectPicList.map((itemDynamicSelectedPicTask) {
            return itemDynamicSelectedPicTask.uploadByData(cosEntity.data.data);
          }));
          //图片json串
          params['images'] =
              json.encode(ctx.state.selectPicList.map((UploadTask dspt) {
            return dspt.resourcePath();
          }).toList());
        }
      }
      var result = await RequestClient.request<OutermostEntity>(
          ctx.context, HttpConstants.UpdateAdoption,
          queryParameters: params);
      if (result.hasSuccess) {
        showToast("修改成功");
        Navigator.pop(ctx.context);
      }
    } catch (e) {} finally {
      NavigatorHelper.showLoadingDialog(ctx.context, false);
    }
  }
}

Future commitAdd(Action action, Context<AdoptionAddState> ctx) async {
  var state = ctx.state;
  if (state.petTypeId == null) {
    showToast("请选择宠物种类");
    return;
  }
  if (state.sex == null) {
    showToast("请选择宠物性别");
    return;
  }

  if (state.isExpellingParasite == null) {
    showToast("请选择是否驱虫");
    return;
  }
  if (state.isSterilization == null) {
    showToast("请选择宠物是否绝育");
    return;
  }
  if (state.isImmune == null) {
    showToast("请选择宠物接种疫苗");
    return;
  }
  if (state.petNameTextEditingController.text?.isEmpty == true) {
    showToast("请填写宠物名称");
    return;
  }
  if (state.descriptionTextEditingController.text?.isEmpty == true) {
    showToast("请填写描述信息");
    return;
  }
  if (int.tryParse(state.ageTextEditingController.text) == null) {
    showToast("请填写正确的宠物月份");
    return;
  }
  if (state.adoptionType == 1) {
    //说明是押金领养
    if (int.tryParse(state.cashPledgeTextEditingController.text) == null) {
      showToast("请填写正确的押金金额");
      return;
    } else if (int.tryParse(
            state.cashPledgeDeadlineTextEditingController.text) ==
        null) {
      showToast("请填写正确的押金规范期限");
      return;
    }
  } else if (state.adoptionType == 2) {
    //说明是收费领养
    if (int.tryParse(state.moneyPledgeTextEditingController.text) == null) {
      showToast("请填写正确的收费金额");
      return;
    }
  }
  if (state.requestTextEditingController.text?.isEmpty == true) {
    showToast("请填写宠物领养要求");
    return;
  }
  if (state.masterNameTextEditingController.text?.isEmpty == true) {
    showToast("请填写宠物送养人姓名");
    return;
  }
  if (ctx.state.selectPicList.length <= 0) {
    showToast("图片必须上传一张");
    return;
  }

  var cosEntity = await RequestClient.request<CosEntity>(
      ctx.context, HttpConstants.PeriodEffectiveSign,
      queryParameters: {'type': CosType.Adoption_TYPE});
  if (cosEntity.hasSuccess) {
    NavigatorHelper.showLoadingDialog(ctx.context, true);
    Future.wait(ctx.state.selectPicList.map((itemDynamicSelectedPicTask) {
      return itemDynamicSelectedPicTask.uploadByData(cosEntity.data.data);
    })).then((List onValue) async {
      //图片json串
      String picJson =
          json.encode(ctx.state.selectPicList.map((UploadTask dspt) {
        return dspt.resourcePath();
      }).toList());
      var result = await commitAddUltimately(ctx, picJson);
      NavigatorHelper.showLoadingDialog(ctx.context, false);
      if (result.hasSuccess) {
        showToast("发布成功");
        Navigator.pop(ctx.context);
      }
    }).catchError((onError) {
//      showToast("图片上传失败,发布失败");
      NavigatorHelper.showLoadingDialog(ctx.context, false);
    });
  }
}

Future<netWork.Result<OutermostEntity>> commitAddUltimately(
    Context<AdoptionAddState> ctx, String picJson) async {
  var state = ctx.state;
  //动态参数
  var otherParams = Map<String, dynamic>();
  if (ctx.state.adoptionType == 1) {
    otherParams["money"] = ctx.state.cashPledgeTextEditingController.text;
    otherParams["deadLine"] =
        ctx.state.cashPledgeDeadlineTextEditingController.text;
  } else if (ctx.state.adoptionType == 2) {
    otherParams["money"] = ctx.state.moneyPledgeTextEditingController.text;
  }
  return RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.AdoptionAdd,
      showLoadingIndicator: true,
      queryParameters: {
        'petTypeId': state.petTypeId,
        'petSubTypeId': state.petSubTypeId,
        'petName': state.petNameTextEditingController.text,
        'sex': state.sex,
        'age': state.ageTextEditingController.text,
        'images': picJson,
        //
        'isImmune': state.isImmune,
        'isSterilization': state.isSterilization,
        'isExpellingParasite': state.isExpellingParasite,
        //
        'description': state.descriptionTextEditingController.text,
        'request': state.requestTextEditingController.text,
        'masterName': state.masterNameTextEditingController.text,
        'provinceId': state.city.provinceId,
        'cityId': state.city.cityId,
        'areaId': state.city.areaId,
        'adoptionType': state.adoptionType,
        ...otherParams
      });
}

Future _onReselectPic(Action action, Context<AdoptionAddState> ctx) async {
  List<String> imgList = await NavigatorHelper.pushFileSelectPageString(
      ctx.context,
      maxSelected: 5);
  if ((imgList?.length ?? 0) > 0) {
    ctx.dispatch(AdoptionAddActionCreator.onChangeSelectPic(
        imgList.map((item) => UploadTask(item)).toList()));
  }
}
