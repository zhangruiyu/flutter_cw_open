import 'dart:convert';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

Effect<AddTallyState> buildEffect() {
  return combineEffects(<Object, Effect<AddTallyState>>{
    AddTallyAction.AddTally: _onAddTally,
    AddTallyAction.SelectTallyImage: _onSelectTallyImage,
  });
}

Future _onAddTally(Action action, Context<AddTallyState> ctx) async {
  if (ctx.state.selectId.length == 0) {
    showToast("最少应选择一个标签");
  } else {
    if (ctx.state.image != null) {
      NavigatorHelper.showLoadingDialog(ctx.context, true);
      Result<CosEntity> cosEntity = await RequestClient.request<CosEntity>(
          ctx.context, HttpConstants.PeriodEffectiveSign,
          queryParameters: {'type': CosType.Tally_TYPE});
      if (cosEntity.hasSuccess) {
        var resourcePath = await UploadTask(ctx.state.image.path)
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
}

Future _onSelectTallyImage(Action action, Context<AddTallyState> ctx) async {
  var image = (await ImagePicker.pickImage(source: ImageSource.gallery));
  ctx.dispatch(AddTallyActionCreator.onSetTallyImage(image));
}

commit(Action action, Context<AddTallyState> ctx, {String resourcePath}) async {
  var result = await RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.AddTally,
      queryParameters: {
        'takeDate': ctx.state.takeDate,
        'selectId': jsonEncode(ctx.state.selectId),
        'price': ctx.state.priceTextEditingController.text,
        'image': resourcePath,
        'remake': ctx.state.remarkTextEditingController.text,
      });
  if (result.hasSuccess) {
    Navigator.pop(ctx.context);
  }
}
