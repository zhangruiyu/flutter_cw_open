import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(VirtualProductReviewState state, Dispatch dispatch,
    ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("兑换二维码和文字码"),
    ),
    body: PageView(
      controller: state.controller,
      children: state.virtualProduct.map((item) {
        var indexOf = state.virtualProduct.indexOf(item);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Text("${indexOf + 1}/${state.virtualProduct.length}"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Text(
                  item.name,
                  style: Theme.of(viewService.context).textTheme.title,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: WindowUtils.getScreenWidth() * 0.15,
                    vertical: 20.0),
                child: QrImage(
//                  embeddedImage: CachedNetworkImageProvider(
//                      state.virtualProduct.pic.first),
                  data: item.content,
                  version: QrVersions.auto,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Text("文字码:  " + item.content),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item.remake),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}
