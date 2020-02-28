import 'dart:async';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/localizetion/default_localization.dart';
import 'package:flutter/material.dart' hide Action;

class CountDownButton extends StatefulWidget {
  final Future<void> Function() future;

  final int state;

  @override
  _CountDownButtonState createState() => _CountDownButtonState();

  CountDownButton(this.future, {this.state = 1});
}

class _CountDownButtonState extends State<CountDownButton> {
  //1是可以点击 默认是1 0是不能点击 正在倒计时
  int state;
  int countDown;
  Timer timer;
  bool isFirst;

  @override
  void initState() {
    super.initState();
    state = widget.state;
    countDown = 0;
    isFirst = true;
  }

  @override
  void didUpdateWidget(CountDownButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    var of = Theme.of(context);
    String text;
    if (countDown > 0) {
      text = "$countDown s";
    } else {
      if (isFirst) {
        text = DefaultLocalizations.of(context).loginSmsCode;
      } else {
        text = DefaultLocalizations.of(context).loginSmsCode;
      }
    }
    return GestureDetector(
      onTap: () {
        if (state == 1) {
          widget.future().then((onValue) {
            if (mounted) {
              setState(() {
                countDown = 60;
                state = 0;
                timer =
                    new Timer.periodic(new Duration(seconds: 1), (Timer timer) {
                  countDown--;
                  if (countDown > 0) {
                    if (mounted) {
                      this.setState(() {
                        state = 0;
                      });
                    }
                  } else {
                    _clearTimer();
                    if (mounted) {
                      this.setState(() {
                        state = 1;
                        isFirst = false;
                      });
                    }
                  }
                });
              });
            }
          }).catchError((onError) {
            print(onError);
          });
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 100.0,
        child: Center(
          child: Container(
            width: 100.0,
            height: 30.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              text,
              style: TextStyle(
                  color: state == 0 || countDown > 0
                      ? colorB2B2B2
                      : of.accentColor),
            ),
          ),
        ),
      ),
    );
  }

  _clearTimer() {
    timer?.cancel();
    timer = null;
  }
}
