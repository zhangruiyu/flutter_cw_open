import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/my_pet/selecttype/model/pet_type_entity.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/global_store/action.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/network/entity/outermost_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';
import 'package:umengshare/umengshare.dart';
import 'action.dart';
import 'model/login_entity.dart';
import 'state.dart';

Effect<AutoState> buildEffect() {
  return combineEffects(<Object, Effect<AutoState>>{
    AutoAction.SendAutoCode: _onSendAutoCode,
    AutoAction.Login: _onLogin,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<AutoState> ctx) {
  var textChangeListener = () {
    ctx.dispatch(AutoActionCreator.onCheckOK(
        ctx.state.telTextEditingController.text.length == 11 &&
            ctx.state.autoCodeTextEditingController.text.length == 6));
  };

  ctx.state.telTextEditingController.addListener(textChangeListener);
  ctx.state.autoCodeTextEditingController.addListener(textChangeListener);
}

Future _onSendAutoCode(Action action, Context<AutoState> ctx) async {
  var result = await RequestClient.request<OutermostEntity>(
      ctx.context, HttpConstants.SendCode,
      queryParameters: {'tel': ctx.state.telTextEditingController.text},
      showLoadingIndicator: true);
  if (result.hasSuccess) {
    action.payload['completer']();
  }
}

Future _onLogin(Action action, Context<AutoState> ctx) async {
  Result<LoginEntity> result;
  //第三方登录的参数
  Map<String, dynamic> queryParameters;
  if (action.payload == "qq" || action.payload == "wechat") {
//{msg: , ret: 0, unionid: , gender: 男, is_yellow_vip: 0, city: 朝阳, level: 0, openid: 050DE67E9DF84FDA37DCF08F94D6FF2F, profile_image_url: http://thirdqq.qlogo.cn/g?b=oidb&k=3OPDOC5fkyMSpudJ2Hvdmw&s=100, accessToken: D9F5599646F6B19E59FA13D022433405, access_token: D9F5599646F6B19E59FA13D022433405, uid: 050DE67E9DF84FDA37DCF08F94D6FF2F, is_yellow_year_vip: 0, province: 北京, screen_name: 牛顿, name: 牛顿, iconurl: http://thirdqq.qlogo.cn/g?b=oidb&k=3OPDOC5fkyMSpudJ2Hvdmw&s=100, yellow_vip_level: 0, expiration: 1568907416357, vip: 0, expires_in: 1568907416357, um_status: SUCCESS}
    //{country: 贝宁, unionid: o6_BWwoe6r-tWl8Qhvp93u4Fnb7o, gender: 男, city: , openid: oPW1e1OuJCrflSz8D_W5S1HtB984, language: zh_CN, profile_image_url: http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqgc4cglcmCSl3OVxOUtVoibtPlicSicaKnyDufoYHqz1iaw7PfyS4QfKqicBmqlPaLzRy0wsSSyJ06IFQ/132, accessToken: 25_Fe0vmgYZ0-k966E8Hlh1h1uKtk4ehspyUBYRhGyPcpfv7eYC-z0kI6Vf1weBPRbI1XMgIB0jsBnSERk1cEaX1QoGdI4eUQxQyG9yrR8Doyo, access_token: 25_Fe0vmgYZ0-k966E8Hlh1h1uKtk4ehspyUBYRhGyPcpfv7eYC-z0kI6Vf1weBPRbI1XMgIB0jsBnSERk1cEaX1QoGdI4eUQxQyG9yrR8Doyo, uid: o6_BWwoe6r-tWl8Qhvp93u4Fnb7o, province: , screen_name: 得得得, name: 得得得, iconurl: http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqgc4cglcmCSl3OVxOUtVoibtPlicSicaKnyDufoYHqz1iaw7PfyS4QfKqicBmqlPaLzRy0wsSSyJ06IFQ/132, expiration: 1567492973975, expires_in: 1567492973975, um_status: SUCCESS, refreshToken: 25_motTKBEgAtWryycCw7Ssl6kR6uPC9EqTxo0ab3bSmq3xELbXNoFQCQOyrO40qvxP_P23R-l2L8tIpLQPiZk1nSmZXA71oZU2OdI7oe7NhAE}
    var qqResult = await UMengShare.login(
        action.payload == "qq" ? UMPlatform.QQ : UMPlatform.Wechat);
    println(qqResult);
    if (qqResult['um_status'] != "SUCCESS") {
      return;
    }
    //后台处理结果
    result = await RequestClient.request<LoginEntity>(
        ctx.context, HttpConstants.LoginAndRegister,
        queryParameters: queryParameters =
            (qqResult as Map<dynamic, dynamic>).map((key, value) {
          return MapEntry(key.toString(), value);
        })
              ..['type'] = action.payload,
        showLoadingIndicator: true);
  } else {
    result = await RequestClient.request<LoginEntity>(
        ctx.context, HttpConstants.LoginAndRegister,
        queryParameters: {
          'tel': ctx.state.telTextEditingController.text,
          'type': 'tel',
          'autoCode': ctx.state.autoCodeTextEditingController.text,
        },
        showLoadingIndicator: true);
  }
  result
    ..yes((value) {
      UserHelper.login(result.data.data, ctx.context);
    })
    ..no((err) {
      if (err.code == ErrorCode.BIND_TEL_ERROR_CODE) {
        //跳转到验证手机号,然后绑定手机号
        Navigator.pushNamed(ctx.context, PageConstants.BindTelPage, arguments: {
          'queryParameters': queryParameters,
        });
      }
    });
}
