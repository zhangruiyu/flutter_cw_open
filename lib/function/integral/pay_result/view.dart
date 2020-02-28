import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PayResultState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    appBar: Toolbar(
      title: Text("支付结果"),
    ),
    body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "恭喜你,支付成功",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "支付金额: ",
                  style: TextStyle(fontSize: 15.0, color: Colors.black)),
              TextSpan(
                  text: "${state.data.totalFee}",
                  style: TextStyle(fontSize: 15.0, color: of.accentColor)),
              TextSpan(
                  text: "元",
                  style: TextStyle(fontSize: 15.0, color: Colors.black)),
            ])),
          ),
          Container(
            width: WindowUtils.getScreenWidth() - 38 * 2,
            height: 45.0,
            margin: const EdgeInsets.only(top: 92.0, left: 38, right: 38),
            child: RaisedButton(
              elevation: 0.0,
              color: of.accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: Text("返回萌币记录页"),
              textColor: colorWhite,
              onPressed: () {
                Navigator.of(viewService.context).pop();
              },
            ),
          ),
        ],
      ),
    ),
  );
}
