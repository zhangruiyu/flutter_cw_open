import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ItemDynamicAdapterState state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return SliverList(
    delegate: SliverChildBuilderDelegate(buildAdapter.itemBuilder,
        childCount: buildAdapter.itemCount),
  );
}
