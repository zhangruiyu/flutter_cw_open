import 'package:chongmeng/constants/constants.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class QQWXHelper {
  static void init() {
    fluwx.register(
        appId: WXKey, universalLink: "https://www.keleyuanyuan.xyz/");
  }
}
