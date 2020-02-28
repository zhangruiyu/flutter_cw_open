import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/function/my_pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:chongmeng/widget/select_bottom.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'action.dart';
import 'state.dart';

Effect<PetAddState> buildEffect() {
  return combineEffects(<Object, Effect<PetAddState>>{
    PetAddAction.SelectPetAvatar: _onSelectPetAvatar,
    PetAddAction.AddPet: _onAddPet,
    PetAddAction.SelectType: _onSelectType,
  });
}

Future _onSelectType(Action action, Context<PetAddState> ctx) async {
  String type = action.payload;
  Map<String, dynamic> selectResult = {'type': type};
  if (type == "birthday") {
    DatePicker.showDatePicker(ctx.context, locale: DateTimePickerLocale.zh_cn,
        onConfirm: (DateTime dateTime, List<int> selectedIndex) {
      dispatchSelectType(
        ctx,
        selectResult
          ..["key"] = DateUtils.formatData(dateTime)
          ..["value"] = DateUtils.formatData(dateTime),
      );
    });
  } else if (type == "petType") {
    var petTypeEntity = await RequestClient.request<PetTypeEntity>(
        ctx.context, HttpConstants.PetType);
    if (petTypeEntity.hasSuccess) {
      var result = await Navigator.pushNamed(
          ctx.context, PageConstants.SelectTypePage,
          arguments: {'petTypeEntity': petTypeEntity.data.data});
      dispatchSelectType(
          ctx, selectResult..addAll(result as Map<String, dynamic>));
    }
  } else {
    Map<String, dynamic> params;
    if (type == "petTypeId") {
      var result = await RequestClient.request<PetTypeEntity>(
          ctx.context, HttpConstants.PetType);
      if (result.hasSuccess) {
        params = {}
          ..addEntries(result.data.data.map<MapEntry<String, dynamic>>((item) {
            return MapEntry(item.name, item.id);
          }));
      }
    } else if (type == "sex") {
      params = {"MM": 0, "GG": 1, '绝育MM': 2, '绝育GG': 3};
    } else if (type == "status") {
      params = {"正常": 0, "走失": 1, "寻找配偶": 2, "回母星": 3};
    }
    selectResult.addAll(await showModalBottomSheet(
        context: ctx.context,
        builder: (c) {
          return SelectBottom(
            params: params,
          );
        }));
    dispatchSelectType(ctx, selectResult);
  }
}

dispatchSelectType(Context<PetAddState> ctx, selectResult) {
  ctx.dispatch(PetAddActionCreator.onSetType(selectResult));
}

Future _onSelectPetAvatar(Action action, Context<PetAddState> ctx) async {
  var image = (await ImagePicker.pickImage(source: ImageSource.gallery));
  ctx.dispatch(PetAddActionCreator.onSetAvatarPath(image));
}

Future _onAddPet(Action action, Context<PetAddState> ctx) async {
  if (ctx.state.petAvatar != null) {
    NavigatorHelper.showLoadingDialog(ctx.context, true);
    Result<CosEntity> cosEntity = await RequestClient.request<CosEntity>(
        ctx.context, HttpConstants.PeriodEffectiveSign,
        queryParameters: {'type': CosType.Pet_AVATAR_TYPE});
    if (cosEntity.hasSuccess) {
      var resourcePath = await UploadTask(ctx.state.petAvatar.path)
          .uploadByData(cosEntity.data.data);
      NavigatorHelper.showLoadingDialog(ctx.context, false);
      commit(action, ctx, resourcePath: resourcePath);
    } else {
      NavigatorHelper.showLoadingDialog(ctx.context, false);
    }
  } else {
    commit(action, ctx);
  }
}

commit(Action action, Context<PetAddState> ctx, {String resourcePath}) async {
  var result = await RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.AddPet,
      queryParameters: {
        'petId': ctx.state.petType['pet_type_id'],
        'subId': ctx.state.petType['pet_sub_type'],
        'avatar': resourcePath,
        'status': ctx.state.petStatus,
        'birthday': ctx.state.birthday,
        'sex': ctx.state.sex,
        'nick': ctx.state.nickTextEditingController.text,
      },
      showLoadingIndicator: true);
  if (result.hasSuccess) {
    NavigatorHelper.popToMain(ctx.context);
  }
}
