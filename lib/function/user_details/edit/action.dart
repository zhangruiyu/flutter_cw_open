import 'dart:io';

import 'package:fish_redux/fish_redux.dart';

enum UserDetailsEditAction {
  AmendText,
  ReselectAvatar,
  SetLocalAvatar,
  ReselectSex,
  ReselectCity,
  UpdateUserInfo,
}

class UserDetailsEditActionCreator {
  static Action onAmendText(String type) {
    return Action(UserDetailsEditAction.AmendText, payload: type);
  }

  static Action onReselectAvatar() {
    return Action(UserDetailsEditAction.ReselectAvatar);
  }

  static Action onReselectSex() {
    return Action(UserDetailsEditAction.ReselectSex);
  }

  static Action onSetLocalAvatar(File file) {
    return Action(UserDetailsEditAction.SetLocalAvatar, payload: file);
  }

  static Action onReselectCity() {
    return Action(UserDetailsEditAction.ReselectCity);
  }

  static Action onUpdateUserInfo() {
    return Action(UserDetailsEditAction.UpdateUserInfo);
  }
}
