import 'package:fish_redux/fish_redux.dart';

class AppInfoState implements Cloneable<AppInfoState> {
  Map<String, dynamic> data;

  @override
  AppInfoState clone() {
    return AppInfoState()..data = data;
  }
}

AppInfoState initState(Map<String, dynamic> args) {
  return AppInfoState()..data = args;
}
