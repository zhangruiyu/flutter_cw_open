import 'package:fish_redux/fish_redux.dart';

class SettingState implements Cloneable<SettingState> {

  @override
  SettingState clone() {
    return SettingState();
  }
}

SettingState initState(Map<String, dynamic> args) {
  return SettingState();
}
