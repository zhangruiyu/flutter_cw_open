import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../../routes.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    UserDetailsState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var buildAdapter = viewService.buildAdapter();
  //是不是用户本人 还是查看别人信息
  bool isSelf = UserHelper.getOnlineUser().userId == state.userId;
  return Scaffold(
    body: state.data == null
        ? Container()
        : extended.NestedScrollView(
            pinnedHeaderSliverHeightBuilder: () {
              return MediaQuery.of(viewService.context).padding.top +
                  kToolbarHeight;
            },
            innerScrollPositionKeyBuilder: () {
              return Key(state.tabController.index.toString());
            },
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  elevation: 0.0,
                  brightness: Brightness.light,
                  leading: BackButton(
                    color: colorBack,
                  ),
//                backgroundColor: colorWhite,
                  actions: <Widget>[
                    isSelf
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: IconButton(
                              onPressed: () {
                                dispatch(UserDetailsActionCreator
                                    .onSkipEditUserPage());
                              },
                              icon: Icon(
                                Icons.border_color,
                                size: 17.0,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: IconButton(
                              onPressed: () {
                                dispatch(UserDetailsActionCreator
                                    .onSkipConversationPage());
                              },
                              icon: Icon(Icons.message),
                            ))
                  ],

                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(56.0 + 0),
                    child: Container(
                      color: colorWhite,
                      width: double.infinity,
//                    padding: const EdgeInsets.only(top: 28.0),
                      child: TabBar(
                          controller: state.tabController,
//                        indicator: BoxDecoration(
//                          color: Theme.of(viewService.context).accentColor,
//                        ),
                          indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                width: 5.0,
                                color:
                                    Theme.of(viewService.context).accentColor,
                              ),
                              insets: EdgeInsets.symmetric(
                                  horizontal: WindowUtils.getScreenWidth() /
                                      state.pageData.length /
                                      1.9,
                                  vertical: 2.0)),
                          tabs: state.pageData.values
                              .map((item) => Tab(text: item.name))
                              .toList()),
                    ),
                  ),
                  expandedHeight: 340,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      color: colorWhite,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ExtendedImage.network(
                                "https://pics7.baidu.com/feed/14ce36d3d539b600ee906ba88895e02ec75cb799.jpeg?token=4cc8bcf04eaa479fcc085524d0fd2976&s=BB936F854663FEE41895BD230300A040",
                                height: 230.0,
                                width: WindowUtils.getScreenWidth(),
                                fit: BoxFit.cover,
                                enableLoadState: false,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, top: 200.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(60.0),
                                    ),
                                    border: Border.all(
                                      color: colorWhite,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: ClipOval(
                                      child: ExtendedImage.network(
                                    state.data.avatar,
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                    enableLoadState: false,
                                  )),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: buildCenter(state, viewService, isSelf),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: state.tabController,
              children: state.pageData.values.map<Widget>((page) {
                var index = state.pageData.values.toList().indexOf(page);
                var itemBody =
                    buildAdapter.itemBuilder(viewService.context, index);
                return extended.NestedScrollViewInnerScrollPositionKeyWidget(
                  Key(index.toString()),
                  EasyRefresh.custom(
                    firstRefresh: true,
                    controller: page.easyRefreshController,
                    firstRefreshWidget: LoadingWidget(),
                    onRefresh: CompleterUtils.produceCompleterAction(
                        dispatch, UserDetailsActionCreator.onRefreshDynamic,
                        params: (Map<String, dynamic> p) {
                      p['filtrateType'] = page.filtrateType;
                    }),
                    onLoad: CompleterUtils.produceCompleterAction(
                        dispatch, UserDetailsActionCreator.onLoadMoreDynamic,
                        params: (Map<String, dynamic> p) {
                      p['filtrateType'] = page.filtrateType;
                    }),
                    slivers: <Widget>[itemBody],
                  ),
                );
              }).toList(),
            ),
          ),
  );
}

Container buildCenter(
    UserDetailsState state, ViewService viewService, bool isSelf) {
  return Container(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Text(state.data?.subscribersCount?.toString() ?? "*"),
              Text("关注")
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(state.data?.fans?.toString() ?? "*"),
              Text("粉丝")
            ],
          ),
        ),
        Expanded(
          child: InkResponse(
            onTap: () async {
              if (isSelf)
                Navigator.pushNamed(
                    viewService.context, PageConstants.IntegralRecordPage);
            },
            child: Column(
              children: <Widget>[
                Text(state.data?.totalIntegral?.toString() ?? "*"),
                Text("萌币")
              ],
            ),
          ),
        ),
        Expanded(
          child: InkResponse(
            onTap: () async {
              if (isSelf)
                Navigator.pushNamed(
                    viewService.context, PageConstants.MyPetPage);
            },
            child: Column(
              children: <Widget>[
                Text(state.data?.petCount?.toString() ?? "*"),
                Text("宠物")
              ],
            ),
          ),
        )
      ],
    ),
  );
}
