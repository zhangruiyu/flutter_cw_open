import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/movie/model/movie_params_entity.dart';
import 'package:chongmeng/function/movie/movie_details/model/movie_schedule_entity.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/search_cinema_entity.dart';

class CinemaSearchDelegate extends SearchDelegate<String> {
  List<SearchCinemaCinemasList> localData;
  MovieParamsData params;

  CinemaSearchDelegate(this.params) : super(searchFieldLabel: "搜影院");

  @override
  ThemeData appBarTheme(BuildContext context) {
    var of = Theme.of(context);
    return super.appBarTheme(context).copyWith(
          primaryColor: of.accentColor,
          primaryIconTheme: of.primaryIconTheme.copyWith(color: Colors.white),
          primaryColorBrightness: Brightness.light,
          primaryTextTheme: of.textTheme,
        );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
//        if (query.isEmpty) {
//          close(context, null);
//        } else {
//          query = "";
//          showSuggestions(context);
//        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //直接返回推荐值,一样的
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == null || query.isEmpty) {
      return Center(
        child: Text(
          '请输入影院名称',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return buildContent(context);
    }
  }

  Future<SearchCinemaEntity> queryNet(
      BuildContext context, String query) async {
    return Future.value((await RequestClient.request<SearchCinemaEntity>(
            context, params.url,
            isPost: params.isPost,
            header: params.headers,
            queryParameters: {
          'kw': query,
          "cityId": GlobalStore.store.getState().ci,
          ...params.params,
        }))
        .data);
  }

  Widget buildContent(BuildContext context) {
    return FutureBuilder<SearchCinemaEntity>(
      future: queryNet(context, query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          SearchCinemaEntity data = snapshot.data;
          if (data?.cinemas == null) {
            return Center(
              child: Text(
                '没有找到相关影院',
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              var itemCinema = data.cinemas.xList[index];
              return buildSearchItem(context, itemCinema);
            },
            itemCount: data?.cinemas?.xList?.length ?? 0,
          );
        }
        return Container();
      },
    );
  }
}

Column buildSearchItem(
    BuildContext context, SearchCinemaCinemasList itemScheduleData) {
  var blueTags = itemScheduleData.hallType;
  return Column(
    children: <Widget>[
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, PageConstants.MovieCinemaPage,
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
                                  itmTag,
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
