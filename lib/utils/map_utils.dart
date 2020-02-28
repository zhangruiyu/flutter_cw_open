import 'dart:io';

import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:amap_location_fluttify/amap_location_fluttify.dart';

class MapUtils {
  static void openMap(String addr, String lat, String lng) async {
//    String localAdd = Uri.encodeFull(
//        "${state.cinemaMovies.cinemaData.nm} (${state.cinemaMovies.cinemaData.addr})");
    String url = Platform.isAndroid
        ? 'geo:$lat,$lng?q=$addr'
        : 'https://maps.apple.com/?q=$addr&ll=$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showToast("请安装地图软件");
    }
  }

  static Future<void> initMap() async {
    /// !注意: 只要是返回Future的方法, 一律使用`await`修饰, 确保当前方法执行完成后再执行下一行, 在不能使用`await`修饰的环境下, 在`then`方法中执行下一步.
    /// 初始化 iOS在init方法中设置, android需要去AndroidManifest.xml里去设置, 详见 https://lbs.amap.com/api/android-sdk/gettingstarted
    return AmapCore.init('3bdb282eca25ad31bdc1f624dc338839');
  }
}
