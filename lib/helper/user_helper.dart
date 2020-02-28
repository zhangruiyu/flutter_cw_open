import 'dart:convert';
import 'dart:io';

import 'package:chongmeng/function/auto/model/login_entity.dart';
import 'package:chongmeng/function/user_details/model/user_details_entity.dart';
import 'package:chongmeng/global_store/action.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/auto_entity.dart';
import 'model/local_user.dart';
import 'navigator_helper.dart';

class UserHelper {
  static Future<LocalUser> initLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString("user");
    if (user != null) {
      return LocalUser.fromJson(json.decode(user));
    }
    return null;
  }

  static bool isLogin() {
    return GlobalStore.store.getState().localUser != null;
  }

  static LocalUser getOnlineUser() {
    return GlobalStore.store.getState().localUser;
  }

  static setLogin(LocalUser autoEntity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(autoEntity.toJson()));
  }

  static loginCheck(BuildContext context, VoidCallback block) {
    var loginStatus = isLogin();
    //可能为null
    if (loginStatus) {
      block();
    } else {
      logout(context);
    }
  }

  //context为null,就不跳转到登录
  static void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", null);
    /*Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) {
              return AppRoute.getPage(PageConstants.AutoPage);
            }), (route) {
      return null == route;
    });*/
    if (context != null &&
        ModalRoute.of(context).settings.name != PageConstants.AutoPage) {
      NavigatorHelper.pushPageLoginPage(context);
    }
  }

  static String getUserToken() {
    return getOnlineUser()?.token ?? "";
  }

  static void login(LoginData result, BuildContext context) {
    var user = LocalUser.fromJson(result.toJson());
    GlobalStore.store.dispatch(GlobalActionCreator.onUpdateLocalUser(user));
    if (result.hasPet) {
      Navigator.pop(context);
    } else {
      Navigator.popAndPushNamed(context, PageConstants.PetAddPage);
    }
  }

  static void loginNoPop(LoginData result, BuildContext context) {
    var user = LocalUser.fromJson(result.toJson());
    GlobalStore.store.dispatch(GlobalActionCreator.onUpdateLocalUser(user));
  }

  static void updateUserInfo(UserDetailsData data) {
    var user = LocalUser.fromJson(data.toJson());
    GlobalStore.store.dispatch(GlobalActionCreator.onUpdateLocalUser(user));
  }
}
