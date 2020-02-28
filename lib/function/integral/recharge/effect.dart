import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:fluwx/fluwx.dart';
import 'action.dart';
import 'model/pay_result_entity.dart';
import 'model/recharge_commodity_entity.dart';
import 'model/wx_pay_entity.dart';
import 'state.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

Effect<RechargeState> buildEffect() {
  return combineEffects(<Object, Effect<RechargeState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    RechargeAction.Pay: _onPay,
    RechargeAction.Refresh: _onRefresh,
  });
}

Future _onRefresh(Action action, Context<RechargeState> ctx) async {
  var result = await RequestClient.request<RechargeCommodityEntity>(
      ctx.context, HttpConstants.MoneyAllCommodity);
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(RechargeActionCreator.onReSetData(result.data.data));
  }
}

void _dispose(Action action, Context<RechargeState> ctx) {}

void _initState(Action action, Context<RechargeState> ctx) {
  //查询充值状态
  fluwx.responseFromPayment.listen((WeChatPaymentResponse response) async {
    //支付成功
    if (response.errCode == 0 && ctx.state.payPre != null) {
      //轮训请求
      var orderId = ctx.state.payPre.orderId;
      var result = await RequestClient.request<PayResultEntity>(
          ctx.context, HttpConstants.PayStatus,
          queryParameters: {'order_id': orderId, "pay_type": "wechat"},
          showLoadingIndicator: true);
      if (result.hasSuccess) {
        if (result.data.data.status == 1 || result.data.data.status == 2) {
          Navigator.pushReplacementNamed(
              ctx.context, PageConstants.PayResultPage,
              arguments: {'data': result.data.data});
        } else {
          showToast("未查询到支付成功信息,请稍后在积分列表查看,或咨询加入QQ群咨询客服",
              duration: Duration(
                milliseconds: 5000,
              ));
        }
      }
    } else {
      showToast("支付失败");
      println("支付失败${response.errStr}");
    }
    println("response:::: ${response.errCode}");
  });
}

Future _onPay(Action action, Context<RechargeState> ctx) async {
  var money = ctx.state.moneyTextEditingController.text.trim();
  if (int.tryParse(money) != null) {
    var result = await RequestClient.request<WxPayEntity>(
        ctx.context, HttpConstants.PayPre,
        showLoadingIndicator: true,
        queryParameters: {'money': int.parse(money)});
    if (result.hasSuccess) {
      var data = result.data.data;
      ctx.state.payPre = data;
      //安装微信
      if (await fluwx.isWeChatInstalled()) {
        fluwx.payWithWeChat(
          appId: data.appid,
          partnerId: data.partnerid,
          prepayId: data.prepayid,
          packageValue: data.package,
          nonceStr: data.noncestr,
          timeStamp: data.timestamp,
          sign: data.sign,
//          signType: '选填',
//          extData: data.orderId
        );
      } else {
        showToast("请安装微信后再次尝试");
      }
    }
  } else {
    showToast("只能充值整元");
  }
}
