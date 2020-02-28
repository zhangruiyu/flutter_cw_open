import 'dart:ui';

import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/function/movie/movie_details/model/movie_schedule_entity.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/hex_color.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/keep_alive_widget.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MovieDetailsState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
      body: state.detailMovie == null
          ? Container()
          : NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                // These are the slivers that show up in the "outer" scroll view.
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    child: SliverAppBar(
                      leading: new IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: colorWhite,
                        ),
                        onPressed: () {
                          Navigator.pop(viewService.context);
                        },
                      ),
                      title: innerBoxIsScrolled
                          ? Text(
                              state.itemMovie.nm,
                              style: TextStyle(color: colorWhite),
                            )
                          : null,
                      centerTitle: false,
                      pinned: true,
                      floating: false,
                      snap: false,
                      primary: true,
                      expandedHeight: 208 * 0.8 +
                          MediaQueryData.fromWindow(window).padding.top,
                      elevation: 1,
                      //是否显示阴影，直接取值innerBoxIsScrolled，展开不显示阴影，合并后会显示
                      forceElevated: innerBoxIsScrolled,
                      actions: <Widget>[
                        /* new IconButton(
                          icon: Icon(
                            Icons.more_horiz,
                            color: colorWhite,
                          ),
                          onPressed: () {
                            print("更多");
                          },
                        ),*/
                      ],

                      flexibleSpace: new FlexibleSpaceBar(
                        background: Container(
                          padding: EdgeInsets.only(
                              top: MediaQueryData.fromWindow(window)
                                  .padding
                                  .top),
                          decoration: BoxDecoration(
                              color:
                                  HexColor(state.detailMovie.backgroundColor)),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0,
                                    top: 12.0,
                                    bottom: 12.0,
                                    right: 12.0),
                                child: ExtendedImage.network(
                                  state.detailMovie.img
                                      .replaceAll("w.h", "592.832"),
                                  width: 148 * 0.8,
                                  height: 208 * 0.8,
                                ),
                              ),
                              SizedBox(
                                height: 208 * 0.8,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      state.detailMovie.nm,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: colorWhite,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      state.detailMovie.enm,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colorWhite,
                                      ),
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: state.detailMovie.sc.toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: of.accentColor,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text:
                                            "  (${state.detailMovie.snum.toString()}人评)",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: colorWhite,
                                        ),
                                      ),
                                    ])),
                                    Text(
                                      state.detailMovie.cat.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colorWhite,
                                      ),
                                    ),
                                    Text(
                                      state.detailMovie.pubDesc.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: colorWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyTabBarDelegate(
                      child: TabBar(
                        controller: state.tabController,
                        labelStyle: TextStyle(),
                        labelColor: of.accentColor,
                        unselectedLabelColor: colorBack,
                        indicatorColor: of.accentColor,
                        tabs: state.pageData.values
                            .map((itemTab) => Tab(
                                  text: itemTab.name,
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: state.tabController,
                children: state.pageData.keys.map((DateTime name) {
                  var pageData = state.pageData[name];
                  var data = pageData.data;
                  //SafeArea 适配刘海屏的一个widget
                  return KeepAliveWidget(
                    child: SafeArea(
                      top: false,
                      bottom: false,
                      child: Builder(
                        builder: (BuildContext context) {
                          return EasyRefresh.custom(
                            controller: pageData.easyRefreshController,
//                            firstRefresh: true,
//                            firstRefreshWidget: LoadingWidget(),
                            onLoad: CompleterUtils.produceCompleterAction(
                                dispatch,
                                MovieDetailsActionCreator.onLoadSchedule,
                                params: (params) {
                              params['itemPageData'] = pageData;
                            }),
                            key: PageStorageKey<DateTime>(name),
                            slivers: <Widget>[
                              SliverOverlapInjector(
                                handle: NestedScrollView
                                    .sliverOverlapAbsorberHandleFor(context),
                              ),
                              if ((data?.length ?? 0) == 0)
                                SliverToBoxAdapter(
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 200,
                                      child: Text(
                                        "今天暂无对应电影排挡",
                                        style: TextStyle(
                                            color: colorBack, fontSize: 20),
                                      )),
                                ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    var itemScheduleData = data[index];
                                    List<String> blueTags =
                                        itemScheduleData.tag.hallType;
                                    return buildScheduleItem(
                                        viewService,
                                        itemScheduleData,
                                        blueTags,
                                        state.itemMovie.id);
                                  },
                                  childCount: data?.length ?? 0,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }).toList(),
              ),
            ));
}

Column buildScheduleItem(ViewService viewService,
    MovieScheduleCinema itemScheduleData, List<String> blueTags, int movieId) {
  return Column(
    children: <Widget>[
      InkWell(
        onTap: () {
          Navigator.pushNamed(
              viewService.context, PageConstants.MovieCinemaPage, arguments: {
            'movieScheduleData': itemScheduleData,
            'movieId': movieId
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: itemScheduleData.nm,
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  TextSpan(
                      text: itemScheduleData.sellPrice,
                      style: TextStyle(fontSize: 18.0, color: Colors.red[400])),
                  TextSpan(
                      text: "元起",
                      style: TextStyle(fontSize: 12.0, color: Colors.red[400])),
                ])),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      itemScheduleData.addr,
                      style: TextStyle(color: color7E7E7E, fontSize: 12),
                    ),
                  ),
                  Text(
                    itemScheduleData.distance,
                    style: TextStyle(color: color7E7E7E, fontSize: 12),
                  ),
                ],
              ),
              if (blueTags != null && blueTags.length > 0)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SizedBox(
                    height: 18.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: blueTags
                          .map((itmTag) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                margin: EdgeInsets.only(right: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  border: Border.all(
                                    color: Color(0xff589daf),
                                    width: 1.0,
                                  ),
                                ),
                                child: Text(
                                  itmTag,
                                  style: TextStyle(
                                      color: Color(0xff589daf), fontSize: 10.0),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              if (itemScheduleData.showTimes != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    "近期场次: ${itemScheduleData.showTimes}",
                    style: TextStyle(color: color7E7E7E, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
      ),
      VerticalLine(
        height: 10.0,
      )
    ],
  );
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSizeWidget child;
  final Color backgroundColor;

  StickyTabBarDelegate({@required this.child, this.backgroundColor});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: this.child,
      color: backgroundColor ?? colorWhite,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
