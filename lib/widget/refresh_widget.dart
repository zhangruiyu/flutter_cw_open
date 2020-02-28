//import 'package:flutter/material.dart' hide Action;
//import 'package:flutter_easyrefresh/easy_refresh.dart';
//
//import 'loadling_widget.dart';
//
//class EasyRefreshYM extends StatelessWidget {
//  final GlobalKey<EasyRefreshState> refreshKey;
//  final ScrollBehavior behavior;
//
////  final RefreshHeader refreshHeader;
////  final RefreshFooter refreshFooter;
//  final Widget firstRefreshWidget;
//  final Widget emptyWidget;
//  final AnimationStateChanged animationStateChangedCallback;
//  final HeaderStatusChanged headerStatusChanged;
//  final FooterStatusChanged footerStatusChanged;
//  final HeaderHeightChanged headerHeightChanged;
//  final FooterHeightChanged footerHeightChanged;
//  final OnRefresh onRefresh;
//  final LoadMore loadMore;
//  final bool autoLoad;
//  final bool limitScroll;
//  final bool autoControl;
//  final bool firstRefresh;
//  final ScrollController outerController;
//  final Widget child;
//
//  EasyRefreshYM(
//      {this.refreshKey,
//      this.behavior,
////      this.refreshHeader,
////      this.refreshFooter,
//      this.firstRefreshWidget,
//      this.emptyWidget,
//      this.animationStateChangedCallback,
//      this.headerStatusChanged,
//      this.footerStatusChanged,
//      this.headerHeightChanged,
//      this.footerHeightChanged,
//      this.onRefresh,
//      this.loadMore,
//      this.autoLoad: false,
//      this.limitScroll: false,
//      this.autoControl: true,
//      this.firstRefresh: false,
//      this.outerController,
//      this.child});
//
//  @override
//  Widget build(BuildContext context) {
//    return EasyRefresh(
//        key: refreshKey,
//        behavior: behavior,
//        /* refreshHeader: refreshHeader ??
//            ClassicsHeader(
//              key: new GlobalKey<RefreshHeaderState>(),
//              refreshText: "下拉刷新",
//              refreshReadyText: "释放刷新",
//              refreshingText: "正在刷新...",
//              refreshedText: "刷新完成",
//            ),
//        refreshFooter: refreshFooter ??
//            ClassicsFooter(
//              key: new GlobalKey<RefreshFooterState>(),
//              loadText: "上拉加载",
//              loadReadyText: "释放加载",
//              loadingText: "正在加载",
//              loadedText: "加载完成",
//              noMoreText: "没有更多数据",
//            ),*/
//        firstRefreshWidget: firstRefreshWidget ?? LoadingWidget(),
//        emptyWidget: emptyWidget,
//        animationStateChangedCallback: animationStateChangedCallback,
//        headerStatusChanged: headerStatusChanged,
//        footerStatusChanged: footerStatusChanged,
//        headerHeightChanged: headerHeightChanged,
//        footerHeightChanged: footerHeightChanged,
//        onRefresh: onRefresh,
//        loadMore: loadMore,
//        autoLoad: autoLoad,
//        limitScroll: limitScroll,
//        autoControl: autoControl,
//        firstRefresh: firstRefresh,
//        outerController: outerController,
//        child: child);
//  }
//}
