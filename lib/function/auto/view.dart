import 'dart:async';

import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/keyboard_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/count_down_button.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Widget buildView(AutoState state, Dispatch dispatch, ViewService viewService) {
  var themeData = Theme.of(viewService.context);
  return Scaffold(
    appBar: Toolbar(),
    body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        KeyboardUtils.hide();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(left: 37.0, top: 52.0, bottom: 50.0),
                child: Text(
                  "手机号码登录",
                  style: TextStyle(fontSize: 18.0, color: color343434),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                child: TextField(
//                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    controller: state.telTextEditingController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: colore3e3e3),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: themeData.accentColor),
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                        hintText: "请输入手机号",
                        hintStyle: TextStyle(
                            color: colorA4A4A4,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300)),
                    maxLength: 11,
                    buildCounter: (BuildContext context,
                            {int currentLength,
                            int maxLength,
                            bool isFocused}) =>
                        null,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0, right: 38.0),
                child: TextFormField(
                    focusNode: state.autoCodeFocusNode,
                    keyboardType: TextInputType.phone,
                    controller: state.autoCodeTextEditingController,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: colore3e3e3),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2.0, color: themeData.accentColor),
                        ),
                        suffixIcon: CountDownButton(
                          CompleterUtils.produceCompleterAction(
                              dispatch, AutoActionCreator.onSendAutoCode),
                          state: state.telTextEditingController.text.length ==
                                  11 //小于11位不能点击
                              ? 1
                              : 0,
                        ),
                        contentPadding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                        hintText: "请输入验证码",
                        hintStyle: TextStyle(
                            color: colorA4A4A4,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300)),
                    maxLength: 6,
                    buildCounter: (BuildContext context,
                            {int currentLength,
                            int maxLength,
                            bool isFocused}) =>
                        null,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                width: WindowUtils.getScreenWidth() - 38 * 2,
                height: 45.0,
                margin: const EdgeInsets.only(top: 22.0, left: 38, right: 38),
                child: RaisedButton(
                  elevation: 0.0,
                  color: state.isCheckOK ? themeData.accentColor : colorE4E4E4,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(22.0)),
                  child: Text("立即登录"),
                  textColor: colorWhite,
                  onPressed: () {
                    dispatch(AutoActionCreator.onLogin("tel"));
                  },
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset(
                'assets/auto_page_bg.png',
                fit: BoxFit.fitWidth,
                width: WindowUtils.getScreenWidth(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 68.0),
                child: RichText(
                  text: TextSpan(
                    text: "登录即同意 ",
                    children: [
                      TextSpan(
                        text: "《用户协议》",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            NavigatorHelper.pushWebPage(
                                viewService.context,
                                "用户协议",
                                "${HttpConstants.BaseUrl}/assets/protocol.html");
                          },
                        style: TextStyle(fontSize: 12.0, color: colorFF6000),
                      ),
                      TextSpan(
                        text: "和",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      TextSpan(
                        text: "《隐私政策》",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            NavigatorHelper.pushWebPage(
                                viewService.context,
                                "隐私政策",
                                "${HttpConstants.BaseUrl}/assets/protocol.html");
                          },
                        style: TextStyle(fontSize: 12.0, color: colorFF6000),
                      ),
                    ],
                    style: TextStyle(fontSize: 12.0, color: color343434),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 138.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            dispatch(AutoActionCreator.onLogin('qq'));
                          },
                          icon: Image.asset("assets/qq.png"),
                        ),
                        Text("QQ")
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            dispatch(AutoActionCreator.onLogin('wechat'));
                          },
                          icon: Image.asset("assets/wechat.png"),
                        ),
                        Text("微信")
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
