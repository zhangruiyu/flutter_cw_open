import 'dart:async';
import 'dart:ui';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:flutter/material.dart';
import 'package:janalytics/janalytics.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:jverify/jverify.dart';

JmessageFlutter jmessage = JmessageFlutter();
Janalytics janalytics = new Janalytics();
JPush jpush = new JPush();
Jverify jverify = new Jverify();

class JiguangUtils {
  static String JpushKey = "5273001af03971f6b56827d1";
  static String imUserNamePrefix = "chongmeng_";

  static init(String channel) async {
    if (isRelease) {
      janalytics.initCrashHandler();
    }
    if (UserHelper.getOnlineUser()?.userId?.toString()?.isNotEmpty == true) {
      janalytics
          .identifyAccount(UserHelper.getOnlineUser()?.userId?.toString());
    }
    janalytics.setup(
      appKey: JpushKey,
      channel: channel,
    );
    janalytics.setDebugMode(!isRelease);
    jpush.setup(
      appKey: JpushKey,
      channel: channel,
      production: isRelease,
      debug: !isRelease, // 设置是否打印 debug 日志
    );
    jpush.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
      },
//      jpush.getRegistrationID().then((rid) { });
    );
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));

    jverify.setup(appKey: JpushKey, channel: channel);

    jmessage.init(
        isProduction: isRelease, isOpenMessageRoaming: true, appkey: JpushKey);
    jmessage.setDebugMode(enable: !isRelease);
  }

  static Future<String> getRegistrationID() async {
    try {
      var rid = await jpush.getRegistrationID();
      debugPrint(rid);
      return rid;
    } catch (e) {
      return "";
    }
  }

  static Future<bool> checkVerifyEnable() async {
    return (await jverify.checkVerifyEnable())["result"];
  }

  static Future<Map<dynamic, dynamic>> loginAuth() async {
    Completer<Map<dynamic, dynamic>> controller =
        Completer<Map<dynamic, dynamic>>();
    final String text_widgetId = "jv_add_custom_text"; // 标识控件 id
    JVCustomWidget textWidget =
        JVCustomWidget(text_widgetId, JVCustomWidgetType.textView);
    textWidget.title = "其他方式登录";
//    textWidget.left = 20;
    textWidget.top = 360;
    textWidget.width = WindowUtils.getScreenWidth().toInt();
    textWidget.height = 40;
    textWidget.titleColor = Color(0xffFFC000).value;
    textWidget.isShowUnderline = true;
    textWidget.textAlignment = JVTextAlignmentType.center;
    textWidget.isClickEnable = true;
// 添加点击事件监听
    jverify.addClikWidgetEventListener(text_widgetId, (eventId) {
      print("receive listener - click widget event :$eventId");
      if (text_widgetId == eventId) {
        print("receive listener - 点击【新加 button】");
        controller.complete({'code': 1011});
        jverify.dismissLoginAuthView();
      }
    });
    jverify.setCustomAuthViewAllWidgets(
        JVUIConfig()
//          ..logoImgPath = "shanyan_logo"
          ..logoWidth = 100
          ..logoHeight = 100
          ..navColor = Colors.white.value
          ..navText = ""
          ..navTextColor = Colors.blue.value
          ..navReturnImgPath = "shanyan_close"
//          ..checkedImgPath = "check_image"
//          ..uncheckedImgPath = "uncheck_image"
          ..loginBtnNormalImage = "login_bt"
          ..loginBtnPressedImage = "login_bt"
          ..loginBtnUnableImage = "login_bt"
          ..logBtnBackgroundPath = "login_bt" //android
          ..logoImgPath = "logo"
          ..clauseBaseColor = Color(0xffFFC000).value
          ..clauseName = "服务及隐私服务协议"
          ..clauseUrl = HttpConstants.BaseUrl + "assets/protocol.html"
//          ..clauseNameTwo = "用户注册协议"
//          ..clauseUrlTwo = "https://app.dfq.mobi/protocal/register"
          ..logBtnOffsetY = 300
          ..logBtnText = "一键登录"
          ..logBtnTextColor = Colors.white.value
          ..numberColor = color343434.value
          ..logoHidden = false
          ..logoOffsetY = 60
          ..numFieldOffsetY = 180
          ..clauseColor = Colors.black.value
          ..privacyOffsetY = 67
          ..sloganOffsetY = 230
          ..sloganTextColor = Colors.black.value
          ..privacyState = true,
        widgets: [textWidget]);
    jverify.loginAuth(true).then((onValue) {
      if (!controller.isCompleted) {
        controller.complete(onValue);
      }
    });
    return controller.future;
  }
}
