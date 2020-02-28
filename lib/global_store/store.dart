import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'reducer.dart';
import 'state.dart';

class GlobalStore {
  static Store<GlobalState> _globalStore;

  //此处默认值调试阶段
  /*static Store<GlobalState> get store =>
      _globalStore ??= createStore<GlobalState>(
          GlobalState(locale: Locale('zh', 'CH')), buildReducer());
*/
  static Store<GlobalState> get store =>
      _globalStore ??= createStore<GlobalState>(GlobalState(), buildReducer());

  static GlobalState get state => store.getState();
}
