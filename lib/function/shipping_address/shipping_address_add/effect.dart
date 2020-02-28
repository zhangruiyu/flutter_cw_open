import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

Effect<ShippingAddressAddState> buildEffect() {
  return combineEffects(<Object, Effect<ShippingAddressAddState>>{
    ShippingAddressAddAction.SelectCity: _onSelectCity,
    ShippingAddressAddAction.CommitAddress: _onCommitAddress,
  });
}

Future _onCommitAddress(
    Action action, Context<ShippingAddressAddState> ctx) async {
  if (ctx.state.consigneeTextEditingController.text.length < 1 ||
      ctx.state.consigneeTextEditingController.text.length > 15) {
    showToast("收件人名称不能小于1位或者大于15位");
    return;
  }
  if (ctx.state.telTextEditingController.text.length != 11) {
    showToast("手机号应为11位");
    return;
  }

  if (ctx.state.addressTextEditingController.text.length > 50) {
    showToast("收件地址不能大于50位");
    return;
  }
  if (ctx.state.result == null) {
    ctx.dispatch(ShippingAddressAddActionCreator.onSelectCity());
    return;
  }
  var result = await RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.AddAddress,
      queryParameters: {
        "tel": ctx.state.telTextEditingController.text,
        "address": ctx.state.addressTextEditingController.text,
        "consignee": ctx.state.consigneeTextEditingController.text,
        "areaId": ctx.state.result.areaId,
      },
      showLoadingIndicator: true);
  if (result.hasSuccess) {
    showToast("添加收货地址成功");
    Navigator.pop(ctx.context);
  }
}

//选择城市
Future _onSelectCity(
    Action action, Context<ShippingAddressAddState> ctx) async {
  ctx.dispatch(ShippingAddressAddActionCreator.onSetCity(
      await CityPickers.showCityPicker(
    context: ctx.context,
  )));
}
