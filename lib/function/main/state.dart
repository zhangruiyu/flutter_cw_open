import 'dart:ui';

import 'package:chongmeng/function/main/account/state.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/function/main/home/state.dart';
import 'package:chongmeng/function/main/store/state.dart';
import 'package:chongmeng/global_store/state.dart';
import 'package:chongmeng/helper/model/local_user.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

import 'adoption/state.dart';
import 'community/state.dart';

class MainState implements GlobalBaseState<MainState> {
  int mainPageIndex;
  HomeState homeState;
  CommunityState communityState;
  AdoptionState adoptionState;
  AccountState accountState;
  StoreState storeState;
  List<Widget> views;

  @override
  MainState clone() {
    return MainState()
      ..mainPageIndex = mainPageIndex
      ..localUser = localUser
      ..locale = locale
      ..views = views
      ..storeState = storeState
      ..communityState = communityState
      ..adoptionState = adoptionState
      ..accountState = accountState
      ..homeState = homeState;
  }

  @override
  LocalUser localUser;

  @override
  Locale locale;
}

MainState initState(Map<String, dynamic> args) {
  return MainState()
    ..mainPageIndex = 0
    ..communityState = CommunityState.initState(args)
    ..adoptionState = AdoptionState.initState(args)
    ..storeState = StoreState.initState(args)
    ..accountState = AccountState.initState(args)
    ..homeState = HomeState.initState(args);
}

ConnOp<MainState, AccountState> accountConnector() {
  return ConnOp<MainState, AccountState>(
    get: (MainState state) {
      return state.accountState.clone()..localUser = state.localUser;
    },
    set: (MainState state, AccountState subState) {
      state.accountState = subState.clone();
    },
  );
}

ConnOp<MainState, CommunityState> communityConnector() {
  return ConnOp<MainState, CommunityState>(
    get: (MainState state) {
      return state.communityState;
    },
    set: (MainState state, CommunityState subState) {
      state.communityState = subState;
    },
  );
}

ConnOp<MainState, AdoptionState> adoptionConnector() {
  return ConnOp<MainState, AdoptionState>(
    get: (MainState state) {
      return state.adoptionState;
    },
    set: (MainState state, AdoptionState subState) {
      state.adoptionState = subState;
    },
  );
}

ConnOp<MainState, HomeState> homeConnector() {
  return ConnOp<MainState, HomeState>(
    get: (MainState state) {
      return state.homeState;
    },
    set: (MainState state, HomeState subState) {
      state.homeState = subState;
    },
  );
}

ConnOp<MainState, StoreState> storeConnector() {
  return ConnOp<MainState, StoreState>(
    get: (MainState state) {
      return state.storeState;
    },
    set: (MainState state, StoreState subState) {
      state.storeState = subState;
    },
  );
}
