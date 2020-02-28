import 'package:jmessage_flutter/jmessage_flutter.dart';

import 'jiguang_utils.dart';

class JMessageUtils {
  static Future resetUnreadMessageCount(target) async {
    if (target is JMUserInfo) {
      JMUserInfo jmUserInfo = target;
      await jmessage.resetUnreadMessageCount(target: jmUserInfo.targetType);
    }
  }
}
