import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MyPetState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(title: Text("我的宠物")),
    body: Column(
      children: <Widget>[
        Expanded(
          child: EasyRefresh.custom(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((c, index) {
                  var data = state.data[index];
                  return Card(
                    child: Container(
                      height: 90.0,
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: ExtendedImage.network(
                              data.avatar,
                              fit: BoxFit.cover,
                              width: 70.0,
                              height: 70.0,
                              enableLoadState: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(data.nick),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 20.0,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(right: 8.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            (Radius.circular(70.0))),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Text(
                                          data.petTypeName,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 20.0,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(right: 8.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            (Radius.circular(70.0))),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Text(
                                          data.birthday,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 20.0,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(right: 8.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            (Radius.circular(70.0))),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Text(
                                          data.sex.toString(),
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }, childCount: state.data?.length ?? 0),
              )
            ],
            onRefresh: CompleterUtils.produceCompleterAction(
              dispatch,
              MyPetActionCreator.onRefresh,
            ),
            firstRefreshWidget: LoadingWidget(),
            firstRefresh: true,
          ),
        ),
        new Container(
          width: WindowUtils.getScreenWidth(),
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(viewService.context).padding.bottom + 30.0,
              left: 30.0,
              right: 30.0),
          height: 50.0,
          child: new RaisedButton(
            child: new Text(
              '添加宠物',
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 18.0, color: colorWhite),
            ),
            onPressed: () {
              dispatch(MyPetActionCreator.onSkipAddPetPage());
            },
            color: Theme.of(viewService.context).accentColor,
          ),
        ),
      ],
    ),
  );
}
