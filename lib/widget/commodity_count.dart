import 'package:chongmeng/constants/colors.dart';
import 'package:flutter/material.dart';

class CommodityCount extends StatefulWidget {
  final int initCount;
  final int maxCount;
  final CommodityCountController commodityCountController;

  CommodityCount(
      {this.initCount, this.maxCount, this.commodityCountController});

  @override
  _CommodityCountState createState() => _CommodityCountState();
}

class _CommodityCountState extends State<CommodityCount> {
  int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.remove,
            size: 20,
          ),
          onPressed: () {
            if (count > 1) {
              setState(() {
                count--;
                widget.commodityCountController?.count = count;
              });
            }
          },
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              color: colorE4E4E4),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          child: Text(count.toString()),
        ),
        IconButton(
          icon: Icon(
            Icons.add,
            size: 20,
          ),
          onPressed: () {
            if (count < widget.maxCount) {
              setState(() {
                count++;
                widget.commodityCountController?.count = count;
              });
            }
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    count = widget.initCount;
    widget.commodityCountController.count = count;
  }
}

class CommodityCountController {
  int count;
}
