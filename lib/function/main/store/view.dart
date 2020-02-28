import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(StoreState state, Dispatch dispatch, ViewService viewService) {
  var buildAdapter = viewService.buildAdapter();
  return Scaffold(
    appBar: Toolbar(
      title: Text("积分"),
      leading: null,
    ),
    body: EasyRefresh.custom(
      firstRefresh: true,
      firstRefreshWidget: LoadingWidget(),
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        StoreActionCreator.onRefresh,
      ),
      /*  onLoad: CompleterUtils.produceCompleterAction(
          dispatch, CommunityActionCreator.onLoadMore,
          params: (Map<String, dynamic> p) {
            p['filtrateType'] = page.filtrateType;
          }),*/
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: viewService.buildComponent('notice'),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(buildAdapter.itemBuilder,
              childCount: buildAdapter.itemCount),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 4.0, crossAxisSpacing: 4.0),
        )
      ],
    ),
  );
}
