import 'dart:async';

import 'package:chongmeng/constants/colors.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:percent_indicator/circular_percent_indicator.dart';

class RecordButton extends StatefulWidget {
  final GestureTapCallback onTap;
  final GestureLongPressStartCallback onLongPressStart;
  final GestureLongPressEndCallback onLongPressEnd;
  final int maxSecond;

  RecordButton(
      {this.onTap,
      this.onLongPressStart,
      this.onLongPressEnd,
      this.maxSecond: 20});

  @override
  _RecordButtonState createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  double percent = 0.0;
  Timer timer;
  int longPressTime;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPressStart: (e) {
        longPressTime = DateTime.now().millisecondsSinceEpoch;
        timer =
            new Timer.periodic(new Duration(milliseconds: 30), (Timer timer) {
          changePercent();
        });
        widget.onLongPressStart(e);
      },
      onLongPressEnd: (e) {
        //说明没有录制过最大限制
        if (timer != null) {
          widget.onLongPressEnd(e);
        }
        disposeTimer();
        if (!mounted) {
          setState(() {
            percent = 0.0;
          });
        }
      },
      child: new CircularPercentIndicator(
        radius: 100.0,
        lineWidth: 10.0,
        percent: percent,
        center: new Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(90.0))),
        ),
//                backgroundColor: Colors.white,
        backgroundColor: colord9d9d9,
        progressColor: Theme.of(context).accentColor,
      ),
    );
  }

  changePercent() {
    var recordMillisecond =
        DateTime.now().millisecondsSinceEpoch - longPressTime;
    setState(() {
      if (recordMillisecond < widget.maxSecond * 1000) {
        println("$recordMillisecond  ::: ${widget.maxSecond * 1000}");
        //结束录制
        percent =
            recordMillisecond.toDouble() / (widget.maxSecond * 1000).toDouble();
      } else {
        disposeTimer();
        percent = 0.0;
        widget.onLongPressEnd(null);
      }
    });
  }

  void disposeTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

  @override
  void dispose() {
    disposeTimer();
    super.dispose();
  }
}
