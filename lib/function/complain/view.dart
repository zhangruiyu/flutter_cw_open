import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ComplainState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var data = [
    "广告或垃圾信息",
    "低俗或色情",
    "违法相关法律规定或管理规定",
    "未经授权的下载资源",
    "不雅词句,辱骂或不友善",
    "引战或过于偏激的主观判断",
    "泄漏他人隐私",
    "侵犯权益",
  ];

  return Scaffold(
    appBar: Toolbar(
      title: Text("举报"),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ...ListTile.divideTiles(
              tiles: data.map((item) {
                var indexOf = data.indexOf(item);
                return ListTile(
                  onTap: () {
                    dispatch(ComplainActionCreator.onChangePosition(indexOf));
                  },
                  title: Text(item),
                  trailing: indexOf == state.selectPosition
                      ? Checkbox(
                          onChanged: (bool value) {},
                          value: indexOf == state.selectPosition,
                        )
                      : null,
                );
              }).toList(),
              color: of.dividerColor),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0),
            width: WindowUtils.getScreenWidth() - 35 * 2,
            height: 45,
            child: RaisedButton(
              elevation: 0.0,
              color: of.accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: Text("立即投诉"),
              textColor: colorWhite,
              onPressed: () {
                NavigatorHelper.showLoadingDialog(viewService.context, true);
                Future.delayed(Duration(milliseconds: 500)).then((onValue) {
                  showToast("已经投诉成功,请等待审核人员处理");
                  NavigatorHelper.showLoadingDialog(viewService.context, false);
                  Navigator.pop(viewService.context);
                });

//            dispatch(RechargeActionCreator.onPay());
              },
            ),
          )
        ],
      ),
    ),
  );
}
