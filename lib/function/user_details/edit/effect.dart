import 'dart:io';

import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/function/user_details/model/user_details_entity.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart' as netWork;
import 'package:chongmeng/widget/select_bottom.dart';
import 'package:city_pickers/city_pickers.dart' as city;
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';

import '../../../routes.dart';
import 'action.dart';
import 'state.dart';

Effect<UserDetailsEditState> buildEffect() {
  return combineEffects(<Object, Effect<UserDetailsEditState>>{
    UserDetailsEditAction.AmendText: _onAmendText,
    UserDetailsEditAction.ReselectAvatar: _onReselectAvatar,
    UserDetailsEditAction.ReselectSex: _onReselectSex,
    UserDetailsEditAction.ReselectCity: _onReselectCity,
    UserDetailsEditAction.UpdateUserInfo: _onUpdateUserInfo,
  });
}

//修改文字
Future _onAmendText(Action action, Context<UserDetailsEditState> ctx) async {
  var user = GlobalStore.store.getState().localUser;
  String nick = user.nickName;
  String description = user.description;
  if (action.payload == "nick") {
    ctx.state.nickTextEditingController.text = (await Navigator.pushNamed(
            ctx.context, PageConstants.EditTextPage,
            arguments: {
              'initText': ctx.state.nickTextEditingController.text,
              'title': "修改昵称",
              "maxLines": 1,
              "maxLength": 10
            })) as String ??
        nick;
  } else if (action.payload == "description") {
    ctx.state.descriptionTextEditingController.text =
        (await Navigator.pushNamed(ctx.context, PageConstants.EditTextPage,
                arguments: {
                  'initText': ctx.state.descriptionTextEditingController.text,
                  'title': "修改个性签名",
                  "maxLines": 6,
                  "maxLength": 50
                })) as String ??
            description;
  }
}

Future _onReselectAvatar(
    Action action, Context<UserDetailsEditState> ctx) async {
  File image = (await ImagePicker.pickImage(source: ImageSource.gallery));
  ctx.dispatch(UserDetailsEditActionCreator.onSetLocalAvatar(image));
}

Future _onReselectSex(Action action, Context<UserDetailsEditState> ctx) async {
  Map<String, dynamic> localSex = await showModalBottomSheet(
      context: ctx.context,
      builder: (c) {
        return SelectBottom(
          params: {'男': 1, '女': 0},
        );
      });
  if (localSex != null)
    ctx.state
      ..sexTextEditingController.text = localSex['key']
      ..localSex = localSex['value'];
}

Future _onReselectCity(Action action, Context<UserDetailsEditState> ctx) async {
  city.Result cityResult = (await city.CityPickers.showCityPicker(
    context: ctx.context,
  ));
  if (cityResult != null) {
    ctx.state
      ..cityResult = cityResult
      ..cityTextEditingController.text =
          cityResult.provinceName + cityResult.cityName + cityResult.areaName;
  }
}

Future _onUpdateUserInfo(
    Action action, Context<UserDetailsEditState> ctx) async {
  var state = ctx.state;
  int changeCount = 0;
  var netData = ctx.state.data;
  if (state.nickTextEditingController.text != netData.nickName) changeCount++;
  if (state.descriptionTextEditingController.text != netData.description)
    changeCount++;
  if (state.sexTextEditingController.text != (netData.sex == 1 ? "男" : "女"))
    changeCount++;
  if (state.cityResult != null) changeCount++;
  if (state.localAvatar != null) changeCount++;

  if (changeCount == 0) {
    showToast("最少修改一项");
    return;
  }
  if (state.nickTextEditingController.text?.isEmpty == true) {
    showToast("请输入昵称");
    return;
  }
  if (state.descriptionTextEditingController.text?.isEmpty == true) {
    showToast("请输入个性签名");
    return;
  }
  if (state.sexTextEditingController.text?.isEmpty == true) {
    showToast("请选择性别");
    return;
  }
  var cosEntity = await netWork.RequestClient.request<CosEntity>(
      ctx.context, HttpConstants.PeriodEffectiveSign,
      queryParameters: {'type': CosType.AVATAR_TYPE});
  if (cosEntity.hasSuccess) {
    if (state.localAvatar != null) {
      NavigatorHelper.showLoadingDialog(ctx.context, true);
      UploadTask(ctx.state.localAvatar.path)
          .uploadByData(cosEntity.data.data)
          .then((picUrl) async {
//      NavigatorHelper.showLoadingDialog(ctx.context, false);
        (await commit(ctx, picUrl)).yes((value) {
          showToast("修改成功");
          Navigator.pop(ctx.context, value.data);
        });
      }).catchError((onError) {
        NavigatorHelper.showLoadingDialog(ctx.context, false);
      });
    } else {
      (await commit(ctx, null)).yes((value) {
        showToast("修改成功");
        Navigator.pop(ctx.context, value.data);
      });
    }
  }
}

Future<netWork.Result<UserDetailsEntity>> commit(
    Context<UserDetailsEditState> ctx, String avatar) async {
  var state = ctx.state;
  return netWork.RequestClient.request<UserDetailsEntity>(
      ctx.context, HttpConstants.UserUpdateProfile,
      showLoadingIndicator: true,
      queryParameters: {
        if (avatar != null) 'avatar': avatar,
        if (state.cityResult != null) 'areaid': state.cityResult.areaId,
        'nick': state.nickTextEditingController.text,
        'description': state.descriptionTextEditingController.text,
        'sex': state.localSex,
      });
}
