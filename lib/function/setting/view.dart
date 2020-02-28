import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/global_store/action.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:path/path.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SettingState state, Dispatch dispatch, ViewService viewService) {
  var user = GlobalStore.store.getState().localUser;
  var edgeInsets = new EdgeInsets.only(top: 10.0);
  const textStyle = const TextStyle();
  var packageInfo = GlobalStore.store.getState().packageInfo;
  return new Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: new Toolbar(
        title: new Text('关于'),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: new Container(
              padding: const EdgeInsets.only(top: 40.0),
              child: new Column(children: <Widget>[
                ClipOval(
                  child: new Image.asset(
                    'assets/logo.png',
                    width: 60.0,
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
                new Padding(
                  padding: edgeInsets,
                  child: new Text('版本号: v${packageInfo.version}'),
                ),
                new Padding(
                  padding: edgeInsets,
                  child: new Text('QQ服务群: 609487304'),
                ),
                new Padding(
                  padding: edgeInsets,
                  child: new Text('如有建议和问题,请加入群反馈'),
                ),
                /* new FlatButton(
                    onPressed: () {
                      */ /*SnackBarUtils.showSnackBar(
                          scaffoldStateKey.currentState, '个人作品,欢迎加入');*/ /*
                    },
                    padding: const EdgeInsets.symmetric(
                        vertical: 13.0, horizontal: 4.0),
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Align(
                            child: new Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: new Text(
                                '关于我们',
                                style: textStyle,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          new Icon(Icons.arrow_right),
                        ])),*/
                new FlatButton(
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                        vertical: 13.0, horizontal: 4.0),
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Align(
                            child: new Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: new Text(
                                '版本更新',
                                style: textStyle,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          new Icon(Icons.arrow_right),
                        ])),
                // onSubmitted：当用户在键盘上点击完成编辑时调用
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
              "Copyright©2019-2019  \n 宠窝工作室版权所有 ",
              textAlign: TextAlign.center,
            ),
          ),
          if (user != null)
            new Container(
              width: WindowUtils.getScreenWidth(),
              height: 50.0 + MediaQuery.of(viewService.context).padding.bottom,
              child: new RaisedButton(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom:
                          MediaQuery.of(viewService.context).padding.bottom),
                  child: new Text(
                    '退出登录',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 18.0, color: colorWhite),
                  ),
                ),
                onPressed: () async {
                  UserHelper.logout(null);
                  GlobalStore.store.dispatch(GlobalActionCreator.onLoginOut());
                  Navigator.of(viewService.context).pop();
                },
                color: Theme.of(viewService.context).accentColor,
              ),
            ),
        ],
      ));
}
