import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/function/integral/model/total_integral_entity.dart';
import 'package:chongmeng/function/shipping_address/model/shipping_address_entity.dart';
import 'package:chongmeng/function/shipping_address/state.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/widget/custom_dialog.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<IntegralCommodityDetailState> buildEffect() {
  return combineEffects(<Object, Effect<IntegralCommodityDetailState>>{
    IntegralCommodityDetailAction.Buy: _onBuy,
    Lifecycle.initState: _initState,
  });
}

Future _initState(
    Action action, Context<IntegralCommodityDetailState> ctx) async {
  var result = await RequestClient.request<TotalIntegralEntity>(
    ctx.context,
    HttpConstants.TotalIntegral,
  );

  if (result.hasSuccess) {
    ctx.dispatch(IntegralCommodityDetailActionCreator.onSetTotalIntegral(
        result.data.data.total));
  }
}

Future _onBuy(Action action, Context<IntegralCommodityDetailState> ctx) async {
  if (ctx.state.totalIntegral == null) {
    var result = await RequestClient.request<TotalIntegralEntity>(
      ctx.context,
      HttpConstants.TotalIntegral,
    );
    if (result.hasSuccess) {
      ctx.state.totalIntegral = result.data.data.total;
    }
  }

  ShippingAddressData selectAddress = await Navigator.pushNamed<dynamic>(
      ctx.context, PageConstants.ShippingAddressPage,
      arguments: {"type": ShippingAddressState.SELECT});
  if (selectAddress != null) {
    var code = await showAffirmDialog(ctx, selectAddress);
    if (code == 1) {
      //发送请求兑换
      var result = await RequestClient.request<OutermostEntity>(
          ctx.context, HttpConstants.BuyIntegralCommodity,
          queryParameters: {
            "buy_count": ctx.state.commodityCountController.count,
            "integral_commodity_id": ctx.state.itemData.id,
            "address_id": selectAddress.id,
          });
      if (result.hasSuccess) {
        showSuccessDialog(ctx);
      } else {
        if (result.error.code == ErrorCode.RECHARGE) {
          Navigator.pushNamed(ctx.context, PageConstants.RechargePage);
        }
      }
    }
  }
}

Future<int> showSuccessDialog(Context<IntegralCommodityDetailState> ctx) {
  var of = Theme.of(ctx.context);
  return showDialog(
      context: ctx.context,
      builder: (BuildContext context) {
        return Container(
          child: CanSetWidthDialog(
              minWidth: 275.0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    color: colorWhite),
                width: double.infinity,
                padding: const EdgeInsets.only(top: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "恭喜您兑换",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                          TextSpan(
                              text: "${ctx.state.itemData.name}",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: of.accentColor,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "成功!!!",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                        ]),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("审核完毕后将为您发货",
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.black))),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: VerticalLine(),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: Text(
                                "兑换其他产品",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              NavigatorHelper.popToMain(context);
                            },
                            behavior: HitTestBehavior.opaque,
                          ),
                        ),
                        VerticalLine(
                          height: 50.0,
                          width: 0.5,
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: Text(
                                "查看订单",
                                textAlign: TextAlign.center,
                                style: of.textTheme.button
                                    .merge(TextStyle(color: of.accentColor)),
                              ),
                            ),
                            onTap: () {
                              NavigatorHelper.popToMain(context);
                              Navigator.pushNamed(
                                  context, PageConstants.MyOrderPage);
                            },
                            behavior: HitTestBehavior.opaque,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        );
      });
}

Future<int> showAffirmDialog(Context<IntegralCommodityDetailState> ctx,
    ShippingAddressData selectAddress) {
  var of = Theme.of(ctx.context);
  return showDialog(
      context: ctx.context,
      builder: (BuildContext context) {
        return Container(
          child: CanSetWidthDialog(
              minWidth: 275.0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    color: colorWhite),
                width: double.infinity,
                padding: const EdgeInsets.only(top: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "确认消耗",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                          TextSpan(
                              text:
                                  "${ctx.state.itemData.integralPrice * ctx.state.commodityCountController.count}",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: of.accentColor,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "萌币兑换此商品吗?",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("手机号  ",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                          Text(selectAddress.tel,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          selectAddress.provincename +
                              selectAddress.cityname +
                              selectAddress.areaname +
                              selectAddress.addressDetails,
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: VerticalLine(),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: Text(
                                "取消",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context, 0);
                            },
                            behavior: HitTestBehavior.opaque,
                          ),
                        ),
                        VerticalLine(
                          height: 50.0,
                          width: 0.5,
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0),
                              child: Text(
                                "确认",
                                textAlign: TextAlign.center,
                                style: of.textTheme.button
                                    .merge(TextStyle(color: of.accentColor)),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context, 1);
                            },
                            behavior: HitTestBehavior.opaque,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        );
      });
}
