import 'package:chongmeng/routes.dart';
import 'package:flutter/material.dart';

class ShareUtils {
  static Future share(BuildContext context, String type,
      {String content, String dec, String url, Widget title}) async {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return routes.buildPage(PageConstants.SharePage, {
            "type": type,
            "content": content,
            "dec": dec,
            "url": url,
            "title": title,
          });
        });
  }

  static bool isShareSuccess(result) {
    if (result == null) {
      return false;
    }
    return result['um_status'] == 'SUCCESS';
  }
}
