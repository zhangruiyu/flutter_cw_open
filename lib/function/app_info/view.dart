import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AppInfoState state, Dispatch dispatch, ViewService viewService) {
  var packageInfo = GlobalStore.store.getState().packageInfo;
  return Scaffold(
    appBar: Toolbar(
      title: Text("应用信息展示--"),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildItem("应用名", packageInfo.appName),
        buildItem("版本号", packageInfo.version),
        buildItem("构建版本号", packageInfo.buildNumber),
        buildItem("包名", packageInfo.packageName),
        buildItem("渠道", state.data['channel']),
        buildItem("极光", state.data['registrationID']),
//        buildItem("唯一标识", state.data['idfa']),
      ],
    ),
  );
}

Widget buildItem(String title, String value) {
  return InkWell(
    onTap: () {
      showToast("已复制值  $value");
      Clipboard.setData(ClipboardData(text: value));
    },
    child: Container(
      width: WindowUtils.getScreenWidth(),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Text("$title:$value"),
    ),
  );
}
