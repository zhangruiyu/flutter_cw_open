import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    InviteState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("我的邀请"),
      actions: <Widget>[
        if (state.data != null)
          IconButton(
            onPressed: () {
              dispatch(InviteActionCreator.onShare());
            },
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
          )
      ],
    ),
    floatingActionButton: state.data != null
        ? FloatingActionButton(
            elevation: 0.0,
            onPressed: () {
              dispatch(InviteActionCreator.onShare());
            },
            child: Icon(
              Icons.share,
              color: Colors.red,
            ),
            backgroundColor: Theme.of(viewService.context).accentColor,
          )
        : null,
    body: EasyRefresh.custom(
      firstRefresh: true,
      firstRefreshWidget: LoadingWidget(),
      onRefresh: CompleterUtils.produceCompleterAction(
          dispatch, InviteActionCreator.onRefresh),
      slivers: state.data == null
          ? []
          : [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        state.data.totalInviteIntegral.toString(),
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0, top: 10),
                      child: Text("累计已收奖励(萌币)"),
                    ),
                    VerticalLine(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "邀请列表",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  var itemInviteRecord = state.data.inviteRecord[index];
                  return Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text(itemInviteRecord.tel),
                      trailing: Text(
                        itemInviteRecord.inviteStatus == 1 ? "符合奖励" : "暂未登录激活",
                        style: TextStyle(
                            color: itemInviteRecord.inviteStatus == 1
                                ? Colors.green
                                : Colors.grey),
                      ),
                    ),
                  );
                }, childCount: state.data.inviteRecord.length),
              ),
            ],
    ),
  );
}
