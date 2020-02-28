import 'dart:io';

import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/function/movie/movie_details/view.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:chongmeng/utils/map_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MovieCinemaState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var itemWidth = WindowUtils.getScreenWidth() / 5;
  var selectCinemaMovie = state.cinemaMovies == null
      ? null
      : state.cinemaMovies.showData.movies[state.selectIndex];
  return Scaffold(
    appBar: Toolbar(
      title: Text(state.movieScheduleData.nm),
    ),
    body: state.cinemaMovies == null
        ? Container()
        : DefaultTabController(
            length: selectCinemaMovie?.shows?.length ?? 0,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                // These are the slivers that show up in the "outer" scroll view.
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(state.cinemaMovies.showData.cinemaName,
                                      style: TextStyle(fontSize: 18)),
                                  Text(
                                    state.cinemaMovies.cinemaData.addr,
                                    style: TextStyle(
                                        fontSize: 12, color: color7E7E7E),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          VerticalLine(
                            width: 1,
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () async {
                                String localAdd = Uri.encodeFull(
                                    "${state.cinemaMovies.cinemaData.nm} (${state.cinemaMovies.cinemaData.addr})");
                                MapUtils.openMap(
                                    localAdd,
                                    state.cinemaMovies.cinemaData.lat
                                        .toString(),
                                    state.cinemaMovies.cinemaData.lng
                                        .toString());
                              },
                              icon: Icon(
                                MdiIcons.mapMarkerRadius,
                                color: Colors.blue[300],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.grey,
                      height: 120,
                      child: ListView.builder(
                        controller: state.movieScrollController,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          int realIndex = index - state.hideCount;
                          if (realIndex < 0 ||
                              realIndex >=
                                  state.cinemaMovies.showData.movies.length) {
                            return AnimatedContainer(
                              width: itemWidth,
                              duration: Duration(milliseconds: 200),
                            );
                          }
                          var itemCinemaMovie =
                              state.cinemaMovies.showData.movies[realIndex];
                          return GestureDetector(
                            onTap: () {
                              dispatch(
                                  MovieCinemaActionCreator.onChangeMovieIndex(
                                      realIndex));
                            },
                            child: AnimatedContainer(
                              width: itemWidth,
                              padding: EdgeInsets.all(
                                  state.selectIndex == realIndex ? 2.0 : 10.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ExtendedImage.network(
                                  itemCinemaMovie.img
                                      .replaceAll("w.h", "592.832"),
                                  width: 148,
                                  fit: BoxFit.fill,
//                                borderRadius: BorderRadius.circular(0.0),
                                  shape: state.selectIndex == realIndex
                                      ? BoxShape.rectangle
                                      : null,
                                  border:
                                      Border.all(width: 1.5, color: colorWhite),
                                  enableLoadState: false,
                                ),
                              ),
                              duration: Duration(milliseconds: 500),
                            ),
                          );
                        },
                        itemCount:
                            state.cinemaMovies.showData.movies.length + 4,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyTabBarDelegate(
                      child: TabBar(
                        isScrollable: true,
                        labelStyle: TextStyle(),
                        labelColor: of.accentColor,
                        unselectedLabelColor: colorBack,
                        indicatorColor: of.accentColor,
                        tabs: selectCinemaMovie.shows
                            .map((itemTab) => Tab(
                                  text: itemTab.dateShow,
                                ))
                            .toList(),
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(
                  children: selectCinemaMovie.shows.map((itemShow) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        var plist = itemShow.plist[index];
                        return Column(
                          children: <Widget>[
                            InkWell(
                              onTap: plist.ticketStatus != 0
                                  ? null
                                  : () {
                                      dispatch(MovieCinemaActionCreator
                                          .onSkipMovieSeatPage(
                                              plist, selectCinemaMovie));
                                    },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 60,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            plist.tm,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            DateUtils.formatHHmm(DateUtils
                                                        .string2dateTime(
                                                            "${plist.dt} ${plist.tm}:00")
                                                    .add(Duration(
                                                        minutes:
                                                            selectCinemaMovie
                                                                .dur))) +
                                                "散场",
                                            style: TextStyle(
                                                color: color7E7E7E,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 25),
                                      height: 60,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text(
                                            plist.lang + plist.tp,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            plist.th,
                                            style: TextStyle(
                                                color: color7E7E7E,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //购买按钮
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3.0, horizontal: 8.0),
                                          decoration: BoxDecoration(
                                            color: plist.ticketStatus != 0
                                                ? Colors.grey[300]
                                                : Colors.red[400],
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5.0),
                                            ),
                                          ),
                                          child: Text(
                                            plist.ticketStatus != 0
                                                ? "停售"
                                                : "购票",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: colorWhite),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            VerticalLine(
                              height: 10,
                            )
                          ],
                        );
                      }, childCount: itemShow.plist.length),
                    )
                  ],
                );
              }).toList()),
            ),
          ),
  );
}
