import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Center(
      child: Container(
        height: 50.0,
        child: Text("暂无数据"),
      ),
    );
  }
}
