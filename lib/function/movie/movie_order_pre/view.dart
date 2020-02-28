import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    MovieOrderPreState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    appBar: Toolbar(
      title: Text("订单支付"),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              ExtendedImage.network(
                state.selectCinemaMovie.img.replaceAll("w.h", "592.832"),
                width: 148,
                height: 208,
                enableLoadState: false,
              ),
              SizedBox(
                height: 208,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        state.seatEntity.seatData.movie.movieName,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${state.seatEntity.seatData.xShow.showDate} ${state.seatEntity.seatData.xShow.showTime} ${state.seatEntity.seatData.xShow.lang + state.seatEntity.seatData.xShow.dim}",
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        state.seatEntity.seatData.cinema.cinemaName,
                        style: TextStyle(color: color7E7E7E),
                      ),
                      Text(
                        state.seatEntity.seatData.hall.hallName,
                        style: TextStyle(color: color7E7E7E),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "市场价: ",
                                  style: TextStyle(
                                      color: color333333, fontSize: 12)),
                              TextSpan(
                                  text: "${state.order.originalPrice}/张",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.red,
                                      decoration: TextDecoration.lineThrough)),
                            ])),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "优惠价: ",
                                  style: TextStyle(
                                      color: color333333, fontSize: 12)),
                              TextSpan(
                                  text:
                                      "萌币:${state.order.discountPrice}/张=(${state.order.discountPriceRmb}元)",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.red,
                                  )),
                            ])),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "共优惠: ",
                                  style: TextStyle(
                                    color: color333333,
                                    fontSize: 12.0,
                                  )),
                              TextSpan(
                                  text:
                                      "萌币:${state.order.totalDiscountPrice}/张=(${state.order.totalDiscountPriceRmb}元)",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.red,
                                  )),
                            ])),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "用户余额: ",
                                  style: TextStyle(
                                      color: color333333, fontSize: 12)),
                              TextSpan(
                                  text: "${state.order.totalUserIntegral}萌币",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.red,
                                  )),
                            ])),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        //座位展示
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("座位"),
              Row(
                children: <Widget>[
                  ...state.localSelectMovie.map((itemSeat) => Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("${itemSeat.rowId}排${itemSeat.columnId}座"),
                      ))
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "影院地址:${state.cinemaMovies.cinemaData.addr}",
            textAlign: TextAlign.start,
          ),
        ),
        VerticalLine(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "购票须知",
            textAlign: TextAlign.start,
          ),
        ),
        VerticalLine(
          height: 1.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            """1、已经出票的订单不可改签、退款。
2、付款后10-60分钟出票，若未能出票，1小时后系统自动退回原支付账户。
3、如有疑问，请联系平台QQ群（有问题随时联系）：609487304。""",
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: SafeArea(
            bottom: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 45.0,
                  margin: const EdgeInsets.only(
                      top: 12.0, left: 38, right: 38, bottom: 12),
                  child: RaisedButton(
                    elevation: 0.0,
                    color: of.accentColor,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(22.0)),
                    child: Text(
                        "${state.order.movieDiscount}折${state.order.totalPay}萌币购买"),
                    textColor: colorWhite,
                    onPressed: () {
                      dispatch(MovieOrderPreActionCreator.onCommit());
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
