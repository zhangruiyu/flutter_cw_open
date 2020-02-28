import 'dart:ui';

import 'package:chongmeng/helper/model/local_user.dart';
import 'package:device_info/device_info.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GlobalBaseState<T extends Cloneable<T>> implements Cloneable<T> {
  Locale get locale;

  set locale(Locale locale);

  LocalUser get localUser;

  set localUser(LocalUser localUser);
}

class GlobalState implements GlobalBaseState<GlobalState> {
  @override
  Locale locale;

  @override
  LocalUser localUser;
  PackageInfo packageInfo;
  String channel;

  SharedPreferences sp;
  int ci;
  String ciName;

  @override
  GlobalState clone() {
    return GlobalState()
      ..ci = ci
      ..ciName = ciName
      ..sp = sp
      ..channel = channel
      ..packageInfo = packageInfo
      ..locale = locale
      ..localUser = localUser;
  }
}
