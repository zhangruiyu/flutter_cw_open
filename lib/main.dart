// Flutter code sample for material.BottomNavigationBar.1

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'dart:io';

import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/utils/map_utils.dart';
import 'package:chongmeng/utils/platform_utils.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'helper/permission_helper.dart';
import 'helper/qqwx_helper.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var isAgree = await PermissionHelper.checkStartAppPermission();
  if (isAgree) {
//    await initializeDateFormatting("zh");
    runApp((await createApp()));
  }
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  EasyRefresh.defaultHeader = MaterialHeader();
  EasyRefresh.defaultFooter = MaterialFooter();
  iniAsync();
}

void iniAsync() async {
  String channel = await PlatformUtils.getChannel();
  GlobalStore.state
        ..packageInfo = await PackageInfo.fromPlatform()
        ..channel = channel
        ..sp = await SharedPreferences.getInstance()
//    ..ci = 10
//    ..ciName = "上海"
      ;
  JiguangUtils.init(channel);
  QQWXHelper.init();
  await MapUtils.initMap();
}
