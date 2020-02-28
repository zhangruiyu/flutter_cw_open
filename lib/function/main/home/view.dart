import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/function/main/home/action.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_vertical_marquee/flutter_vertical_marquee.dart';

import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  var themeData = Theme.of(viewService.context);
  var accentColor = themeData.accentColor;
  var buildAdapter = viewService.buildAdapter();
  return Scaffold(
    backgroundColor: colorWhite,
    body: EasyRefresh.custom(
      controller: state.controller,
      firstRefresh: true,
      firstRefreshWidget: LoadingWidget(),
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        HomeActionCreator.onRefresh,
      ),
      slivers: state.homeData == null
          ? [
              SliverList(
                delegate: SliverChildListDelegate([]),
              )
            ]
          : [
              SliverAppBar(
                backgroundColor: accentColor,
                pinned: true,
                elevation: 0.0,
                floating: true,
                leading: null,
                brightness: Brightness.light,
                automaticallyImplyLeading: false,
                expandedHeight: 197,
                primary: true,
                title: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        viewService.context, PageConstants.SearchPage);
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          new Icon(
                            Icons.search,
                            size: 25.0,
                            color: accentColor,
                          ),
                          Text(
                            "寻觅快乐",
                            style:
                                TextStyle(fontSize: 14.0, color: accentColor),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0x96ffffff),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: viewService.buildComponent("banner"),
                ),
              ),
              SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(Card(
                    margin: const EdgeInsets.all(8.0),
                    child: viewService.buildComponent("tab"),
                  ))),
              SliverToBoxAdapter(
                child: viewService.buildComponent("notice"),
              ),
              if (!(state?.homeData?.isHiddenMovie ?? true))
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Ink.image(
                        fit: BoxFit.fill,
                        width: WindowUtils.getScreenWidth() - 8 * 2,
                        height:
                            (WindowUtils.getScreenWidth() - 8 * 2) * 85 / 359,
                        image: AssetImage("assets/home_movie_banner.png"),
                        child: new InkWell(
                          borderRadius: new BorderRadius.circular(7.0),
                          onTap: () {
                            Navigator.pushNamed(
                                viewService.context, PageConstants.MoviePage);
                          },
                        )),
                  ),
                ),
              SliverList(
                delegate: SliverChildBuilderDelegate(buildAdapter.itemBuilder,
                    childCount: buildAdapter.itemCount),
              )
            ],
    ),
  );
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Widget _tabBar;

  @override
  double get minExtent => 100.0;

  @override
  double get maxExtent => 100.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: new BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFFfafafa), Color(0xFFfcfcfc), Color(0xFFffffff)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
