import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/localizetion/default_localization.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:like_button/like_button.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SplashState state, Dispatch dispatch, ViewService viewService) {
  return new Scaffold(
    backgroundColor: Color(0xffFFC000),
    body: SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          new Container(
              child: new Align(
            alignment: Alignment.topRight,
            child: new Container(
                margin: const EdgeInsets.only(right: 20.0),
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(5.0)),
                child: new FlatButton(
                  child: new Text(
                      '${state.n}s ${DefaultLocalizations.of(viewService.context).splashSkip}'),
                  onPressed: () {
                    dispatch(SplashActionCreator.onPushMainPage());
                  },
                  textColor: const Color(0xffffffff),
                  color: const Color.fromARGB(55, 0, 0, 0),
                )),
          )),
          Column(
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(top: WindowUtils.getScreenHeight() * 0.2),
                child: Image.asset(
                  'assets/logo.png',
                  width: 80.0,
                  height: 80.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  'assets/splash_text.png',
                  height: 40.0,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40.0,
            child: Text(
              "— 以宠为本 —",
              style: TextStyle(
                  color: color333333, fontSize: 14.0, letterSpacing: 10.0),
            ),
          )
        ],
      ),
    ),
  );
}
