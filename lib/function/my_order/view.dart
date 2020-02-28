import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/my_order/virtual_product_review/model/virtual_pruduct.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/empty_widget.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'model/my_order_entity.dart';
import 'state.dart';

var statusText = [
  "等待审核",
  "审核通过",
  "发货中",
  "已完成",
  "失败",
];

Widget buildView(
    MyOrderState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  List data = [
    if (state.data?.storeOrder?.isNotEmpty == true) ...state.data?.storeOrder,
    if (state.data?.movieOrder?.isNotEmpty == true) ...state.data?.movieOrder
  ]..sort((a, b) {
      //排序,2个列表一起展示
      return DateUtils.string2dateTime(b.createTime)
          .millisecondsSinceEpoch
          .compareTo(
              DateUtils.string2dateTime(a.createTime).millisecondsSinceEpoch);
    });

  return Scaffold(
    backgroundColor: of.dividerColor,
    appBar: Toolbar(
      title: Text("我的订单"),
    ),
    body: EasyRefresh.custom(
        firstRefresh: true,
        emptyWidget: (state.data?.storeOrder?.isEmpty == true &&
                state.data?.movieOrder?.isEmpty == true)
            ? EmptyWidget()
            : null,
        firstRefreshWidget: LoadingWidget(),
        onRefresh: CompleterUtils.produceCompleterAction(
          dispatch,
          MyOrderActionCreator.onRefresh,
        ),
        slivers: [
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              var itemData = data[index];
              if (itemData is MyOrderDataStoreorder) {
                return storeItem(
                    viewService, state, index, itemData, dispatch, of);
              } else {
                return movieItem(viewService, state, index,
                    itemData as MyOrderDataMovieorder, dispatch, of);
              }
            }, childCount: data.length),
          )
        ]),
  );
}

Container storeItem(ViewService viewService, MyOrderState state, int index,
    MyOrderDataStoreorder itemData, Dispatch dispatch, ThemeData of) {
  var previewVirtualProduct = itemData.virtualProduct
      .map((itemVirtualProduct) => VirtualProduct(
            invalidTime: itemVirtualProduct.invalidTime,
            content: itemVirtualProduct.content,
            convertTime: itemVirtualProduct.convertTime,
            remake: itemData.externalRemake,
            name: itemData.name,
          ))
      .toList();
  return Container(
    color: Theme.of(viewService.context).dividerColor,
    child: Card(
      elevation: 0.5,
      margin: EdgeInsets.only(
          top: 12.0,
          left: 8.0,
          right: 8.0,
          bottom: state.data.storeOrder.length == (index + 1) ? 12.0 : 0.0),
      child: InkWell(
        onTap: itemData.virtualProduct == null
            ? null
            : () {
                dispatch(MyOrderActionCreator.onSkipReviewPage(
                    previewVirtualProduct, itemData.productType));
              },
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 8, right: 8, bottom: 23),
              height: WindowUtils.getScreenWidth() / 3,
              child: Row(
                children: <Widget>[
                  ExtendedImage.network(
                    itemData.pic.first,
                    cache: true,
                    width: 85,
                    height: 85,
                    fit: BoxFit.cover,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    enableLoadState: false,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      height: 85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  itemData.name,
                                  style: TextStyle(
                                      fontSize: 14, color: color333333),
                                ),
                              )),
                              Text(
                                statusText[itemData.status],
                                style: TextStyle(
                                    fontSize: 14, color: of.accentColor),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("${itemData.integral.abs()}萌币",
                                  style: TextStyle(
                                      fontSize: 14, color: color333333)),
                              Text("x${itemData.count}",
                                  style: TextStyle(
                                      fontSize: 14, color: color333333))
                            ],
                          ),
                          Text(itemData.createTime,
                              style:
                                  TextStyle(fontSize: 12, color: color999999)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: VerticalLine(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        dispatch(MyOrderActionCreator.onShowOrderAddress(
                            itemData.tel,
                            itemData.consigneeName,
                            itemData.addressDetail));
                      },
                      child: Text("查看收件信息",
                          style: TextStyle(fontSize: 13, color: color333333)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 0.5, color: colorCCCCCC)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        dispatch(MyOrderActionCreator.onSkipReviewPage(
                            previewVirtualProduct, itemData.productType));
                      },
                      child: Text(itemData.productType == 0 ? "二维码" : "电子凭证",
                          style: TextStyle(fontSize: 13, color: color333333)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 0.5, color: colorCCCCCC)),
                  ),
                ),
                if (itemData.expressType != null &&
                    itemData.expressNumber != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5.0),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          dispatch(
                              MyOrderActionCreator.onShowExpress(itemData));
                        },
                        child: Text("查看快递信息",
                            style: TextStyle(fontSize: 13, color: color333333)),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(width: 0.5, color: colorCCCCCC)),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Container movieItem(ViewService viewService, MyOrderState state, int index,
    MyOrderDataMovieorder itemData, Dispatch dispatch, ThemeData of) {
  var previewVirtualProduct = itemData.content
      .map((itemVirtualProduct) => VirtualProduct(
            invalidTime: null,
            content: itemVirtualProduct,
            convertTime: null,
            remake: itemData.remake.join("\n"),
            name: itemData.movieName,
          ))
      .toList();
  return Container(
    color: Theme.of(viewService.context).dividerColor,
    child: Card(
      elevation: 0.5,
      margin: EdgeInsets.only(
          top: 12.0,
          left: 8.0,
          right: 8.0,
          bottom: state.data.storeOrder.length == (index + 1) ? 12.0 : 0.0),
      child: InkWell(
        onTap: () {
          if (itemData.content.isNotEmpty == true)
            dispatch(MyOrderActionCreator.onSkipReviewPage(
                previewVirtualProduct, itemData.productType));
        },
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 8, right: 8, bottom: 23),
//              height: WindowUtils.getScreenWidth() / 3,
              child: Row(
                children: <Widget>[
                  ExtendedImage.network(
                    itemData.movieImg.replaceAll("w.h", "592.832"),
                    cache: true,
                    height: 150,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    enableLoadState: false,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
//                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  itemData.movieName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: color333333,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              Text(
                                statusText[itemData.status],
                                style: TextStyle(
                                    fontSize: 14, color: of.accentColor),
                              ),
                            ],
                          ),
                          Text(
                            "${itemData.showDate} ${itemData.showTime}~${DateUtils.formatHHmm(DateUtils.string2dateTime("${itemData.showDate} ${itemData.showTime}:00").add(Duration(minutes: itemData.movieDuration)))} ${itemData.lang} ${itemData.dim}",
                            style: TextStyle(fontSize: 12, color: color333333),
                          ),
                          Text(
                            "${itemData.cinemaAddr} ",
                            style: TextStyle(fontSize: 12, color: color333333),
                          ),
                          Text(
                            "${itemData.hall}",
                            style: TextStyle(fontSize: 12, color: color333333),
                          ),
                          Row(
                            children: (itemData.movieSeat.length > 3
                                    ? itemData.movieSeat.sublist(0, 3).toList()
                                    : itemData.movieSeat)
                                .map((itemSeat) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        "${itemSeat.rowId}排${itemSeat.columnId}座",
                                        style: TextStyle(
                                            fontSize: 12, color: color333333),
                                      ),
                                    ))
                                .toList(),
                          ),
                          if (itemData.movieSeat.length > 3)
                            Row(
                              children: itemData.movieSeat
                                  .sublist(3, itemData.movieSeat.length)
                                  .map((itemSeat) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "${itemSeat.rowId}排${itemSeat.columnId}座",
                                          style: TextStyle(
                                              fontSize: 12, color: color333333),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("${itemData.totalPay.abs()}萌币",
                                  style: TextStyle(
                                      fontSize: 14, color: color333333)),
                              Text("x${itemData.movieSeat.length}",
                                  style: TextStyle(
                                      fontSize: 14, color: color333333))
                            ],
                          ),
                          Text(itemData.createTime,
                              style:
                                  TextStyle(fontSize: 12, color: color999999)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: VerticalLine(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 5.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            dispatch(MyOrderActionCreator.onSkipMap(itemData));
                          },
                          child: Text("导航",
                              style:
                                  TextStyle(fontSize: 13, color: color333333)),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(width: 0.5, color: colorCCCCCC)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        dispatch(MyOrderActionCreator.onShowOrderAddress(
                            itemData.tel,
                            itemData.consigneeName,
                            itemData.addressDetail));
                      },
                      child: Text("查看收件信息",
                          style: TextStyle(fontSize: 13, color: color333333)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 0.5, color: colorCCCCCC)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 5.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        dispatch(MyOrderActionCreator.onSkipReviewPage(
                            previewVirtualProduct, itemData.productType));
                      },
                      child: Text(itemData.productType == 0 ? "二维码" : "电子凭证",
                          style: TextStyle(fontSize: 13, color: color333333)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(width: 0.5, color: colorCCCCCC)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
