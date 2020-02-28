import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/function/main/view.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'model/hot_movie_entity.dart';
import 'state.dart';

Widget buildView(MovieState state, Dispatch dispatch, ViewService viewService) {
  if (state.views == null) {
    state.views = [
      viewService.buildComponent('move_list'),
      viewService.buildComponent('cinema_list'),
    ];
  }
  var of = Theme.of(viewService.context);
  var infoTextStyle = TextStyle(color: color7E7E7E);
  return Scaffold(
    appBar: Toolbar(
      title: GestureDetector(
        onTap: () {
          dispatch(MovieActionCreator.onShowSearch());
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: <Widget>[
                new Icon(
                  Icons.search,
                  size: 25.0,
                  color: of.accentColor,
                ),
                Text(
                  "搜影院",
                  style: TextStyle(fontSize: 14.0, color: of.accentColor),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Color(0xc8ffffff),
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(MovieActionCreator.onSelectCity());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                state.districtText,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
    floatingActionButton: FloatingActionButton(
      elevation: 0.0,
      onPressed: () {
        dispatch(MovieActionCreator.onShare());
      },
      child: Text(
        "赚",
        style: TextStyle(color: colorWhite, fontSize: 20),
      ),
      backgroundColor: Colors.red,
    ),
    body: IndexedStack(
      children: state.views,
      index: state.pageIndex,
    ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: state.pageIndex,
      onTap: (int index) {
        dispatch(MovieActionCreator.onChangeNewPage(index));
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Image.asset('assets/movie_movie_icon_normal.png'),
            activeIcon: Image.asset('assets/movie_movie_icon_select.png'),
            title: Text("电影")),
        BottomNavigationBarItem(
            icon: Image.asset('assets/movie_cinema_icon_normal.png'),
            activeIcon: Image.asset('assets/movie_cinema_icon_select.png'),
            title: Text("影院")),
      ],
    ),
  );
}
