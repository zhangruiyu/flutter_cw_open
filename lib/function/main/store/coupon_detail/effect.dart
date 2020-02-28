import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/share/state.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/network/entity/share_result_entity.dart';
import 'package:chongmeng/network/entity/share_url_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/share_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'action.dart';
import 'model/coupon_entity.dart';
import 'state.dart';

Effect<CouponDetailState> buildEffect() {
  return combineEffects(<Object, Effect<CouponDetailState>>{
    CouponDetailAction.GetCoupon: _onGetCoupon,
    CouponDetailAction.OpenEleme: _onOpenEleme,
    CouponDetailAction.Share: _onShare,
  });
}

Future _onOpenEleme(Action action, Context<CouponDetailState> ctx) async {
  launch("eleme://");
}

Future _onShare(Action action, Context<CouponDetailState> ctx) async {
  (await RequestClient.request<ShareUrlEntity>(
          ctx.context, HttpConstants.shareUrl,
          showLoadingIndicator: true))
      .yes((value) async {
    var result = await ShareUtils.share(
      ctx.context,
      ShareState.h5,
      content: "他来啦,他来啦,他正在使用宠窝app优惠点外卖",
      dec: "我已成功领到大额饿了么优惠券,特邀请您来一起省钱",
      url: value.data.inviteUrl,
      title: Padding(
        child: Text(
          "分享即可得萌币,邀请成功更可获得大额萌币",
          style: TextStyle(fontSize: 18),
        ),
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      ),
    );
    if (ShareUtils.isShareSuccess(result)) {
      (await RequestClient.request<ShareResultEntity>(
              ctx.context, HttpConstants.shareAward,
              queryParameters: {'shareType': 'ElemeShare'},
              showLoadingIndicator: true))
          .yes((value) async {
        showToast("恭喜您,获得${value.data.value}萌币",
            duration: Duration(
              milliseconds: 3300,
            ));
      });
    }
  });
}

Future _onGetCoupon(Action action, Context<CouponDetailState> ctx) async {
  if (int.tryParse(ctx.state.telEditingController.text) == null) {
    showToast('手机号格式不正确');
  } else {
    GlobalStore.store
        .getState()
        .sp
        .setString('couponTel', ctx.state.telEditingController.text);
    var itemType = ctx.state.itemData.types[ctx.state.position];
    //说明需要验证码
    var params = {};
//    println("1231321312");
//    println(ctx.state.positionType);
//    println(ctx.state.positionTypeData);
    if (itemType.type == ctx.state.positionType &&
        ctx.state.positionTypeData != null) {
      params['validateCode'] = ctx.state.codeEditingController.text;
      params['validateToken'] = ctx.state.positionTypeData;
    }
    (await RequestClient.request<CouponEntity>(ctx.context, HttpConstants.Elema,
            queryParameters: {
              'phone': ctx.state.telEditingController.text,
              'type': itemType.type,
              ...params
            },
            showLoadingIndicator: true))
        .yes((value) {
      ctx.dispatch(CouponDetailActionCreator.onSetCoupon(value.data));
    }).no((err) async {
      if (err.code == ErrorCode.RECHARGE) {
        Navigator.pushNamed(ctx.context, PageConstants.RechargePage);
      } else if (err.code == ErrorCode.ELEME_GET_CODE) {
        ctx.state.positionTypeData = err.errorData;
        ctx.state.positionType = itemType.type;
        ctx.dispatch(CouponDetailActionCreator.onElemeCode(itemType.type));
        ctx.state.codeFocusNode.requestFocus();
      }
    });
  }
}
