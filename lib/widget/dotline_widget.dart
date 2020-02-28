import 'package:flutter/material.dart';

class Dotline extends StatelessWidget {
  final double height;
  final double dashHeight;
  final double width;
  final Color color;

  const Dotline(
      {this.height = 1,
      this.width,
      this.dashHeight = 2.0,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final dashCount = (height / (2 * width)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: width,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
        );
      },
    );
  }
}
