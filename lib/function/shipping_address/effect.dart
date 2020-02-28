import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/shipping_address_entity.dart';
import 'state.dart';

Effect<ShippingAddressState> buildEffect() {
  return combineEffects(<Object, Effect<ShippingAddressState>>{
    ShippingAddressAction.Refresh: _onRefresh,
    ShippingAddressAction.SkipAddAddress: _onSkipAddAddress,
  });
}

Future _onRefresh(Action action, Context<ShippingAddressState> ctx) async {
  var result = await RequestClient.request<ShippingAddressEntity>(
      ctx.context, HttpConstants.AddressList);
  if (action.payload['completer'] != null) {
    action.payload['completer']();
  }
  if (result.hasSuccess) {
    ctx.dispatch(ShippingAddressActionCreator.onResetData(result.data.data));
  }
}

Future _onSkipAddAddress(
    Action action, Context<ShippingAddressState> ctx) async {
  await Navigator.pushNamed(ctx.context, PageConstants.ShippingAddressAddPage);
  ctx.dispatch(ShippingAddressActionCreator.onRefresh({}));
}
