import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/movie/model/hot_movie_entity.dart';
import 'package:chongmeng/function/movie/movie_details/model/movie_schedule_entity.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'model/cinema_list_entity.dart';
import 'state.dart';

Widget buildView(
    CinemaListState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var infoTextStyle = TextStyle(color: color7E7E7E);
  return EasyRefresh.custom(
      firstRefresh: true,
      controller: state.easyRefreshController,
      firstRefreshWidget: LoadingWidget(),
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        CinemaListActionCreator.onRefresh,
      ),
      onLoad: CompleterUtils.produceCompleterAction(
        dispatch,
        CinemaListActionCreator.onLoadMore,
      ),
      slivers: [
        if (state.data != null)
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              CinemaListCinema itemMovie = state.data.cinemas[index];
              return buildScheduleItem(viewService, itemMovie);
            }, childCount: state.data.cinemas.length),
          )
      ]);
}

Column buildScheduleItem(
    ViewService viewService, CinemaListCinema itemScheduleData) {
  var blueTags = itemScheduleData.tag?.hallTypeVOList ?? [];
  return Column(
    children: <Widget>[
      InkWell(
        onTap: () {
          Navigator.pushNamed(
              viewService.context, PageConstants.MovieCinemaPage,
              arguments: {
                'movieScheduleData':
                    MovieScheduleCinema.fromJson(itemScheduleData.toJson()),
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
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  TextSpan(
                      text: " ${itemScheduleData.sellPrice}",
                      style: TextStyle(fontSize: 16.0, color: Colors.red[400])),
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
                                  itmTag.name,
                                  style: TextStyle(
                                      color: Color(0xff589daf), fontSize: 10.0),
                                ),
                              ))
                          .toList(),
                    ),
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
