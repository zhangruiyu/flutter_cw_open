import 'dart:convert';

import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'model/seat_entity.dart';
import 'state.dart';

Widget buildView(
    MovieSeatState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var seat = state.seatEntity?.seatData?.seat;
  //数字控件大小
  double numberWidth = 20;
  double padding = 8;
  var itemWidth = (WindowUtils.getScreenWidth() - numberWidth - padding * 2) /
      ((seat?.regions?.first?.rows?.first?.seats?.length ?? 0) + 8);

  return Scaffold(
    backgroundColor: colorf2f2f2,
    appBar: Toolbar(
      title: Text(state.seatEntity?.seatData?.cinema?.cinemaName ?? ""),
    ),
    body: state.seatEntity == null
        ? Container()
        : Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(state.seatEntity.seatData.movie.movieName),
                    Text(
                      "${state.seatEntity.seatData.xShow.showDate}  ${state.seatEntity.seatData.xShow.lang}${state.seatEntity.seatData.xShow.dim}",
                      style: TextStyle(color: color7E7E7E, fontSize: 12),
                    ),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.center,
                width: WindowUtils.getScreenWidth() * 2 / 3,
                margin: EdgeInsets.only(bottom: 40.0, left: numberWidth + 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    color: Colors.grey[300]),
                child: Text(
                  state.seatEntity.seatData.hall.hallName,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              //电影座位展示
              ...seat.regions.first.rows.map((itemColumn) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: Colors.grey[200],
                        alignment: Alignment.center,
                        width: numberWidth,
                        child: Text(itemColumn.rowId.toString()),
                      ),
                      ...itemColumn.seats.map((itemRow) {
                        if (itemRow.columnId.isEmpty ||
                            itemRow.seatStatus == 2) {
                          return Container(
                            width: itemWidth,
                          );
                        }
//                      return Text((itemRow.seatStatus - 1).toString());
                        SeatSeatdataSeatImageSeatlegend image;
                        if (state.localSelectMovie.contains(itemRow)) {
                          //2是已选,已选是我们自己操作的
                          image = seat.image.seatLegends[2];
                        } else if (itemRow.seatStatus == 1) {
                          //1是未选择
                          image = seat.image.seatLegends[0];
                        } else if (itemRow.seatStatus == 3 ||
                            itemRow.seatStatus == 4) {
                          //3,4是已经被别人订了
                          image = seat.image.seatLegends[1];
                        } else {
                          //未知
                          image = seat.image.seatLegends[1];
                        }
//                        println(itemRow.seatStatus);
//                        println(seat.image.seatLegends);
                        return GestureDetector(
                          onTap: itemRow.seatStatus == 1
                              ? () {
                                  dispatch(MovieSeatActionCreator.onSelectSeat(
                                      itemRow));
                                }
                              : null,
                          child: ExtendedImage.network(
                            image.legendIcon,
                            width: itemWidth,
                            enableLoadState: false,
                          ),
                        );
                      }).toList()
                    ],
                  ),
                );
              }).toList(),
              //
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ...seat.image.seatLegends
                        .map((SeatSeatdataSeatImageSeatlegend itemIcon) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 3.0),
                              child: Text(itemIcon.legendName),
                            ),
                            ExtendedImage.network(
                              itemIcon.legendIcon,
                              enableLoadState: false,
                              width: 20,
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
              //已选座位
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: WindowUtils.getScreenWidth() / 4 / 50),
                  itemBuilder: (BuildContext context, int index) {
                    SeatSeatdataSeatRegionsRowsSeat localItemSelectMovie =
                        state.localSelectMovie[index];
                    //选择的列号
                    var seatRowNum = -1;
                    //选择的列id
                    var seatRowId = "";
                    seat.regions.first.rows.forEach((item) {
                      if (item.seats.contains(localItemSelectMovie)) {
                        seatRowNum = item.rowNum;
                        seatRowId = item.rowId;
                      }
                    });
                    var price = state.itemMoney;

                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          dispatch(MovieSeatActionCreator.onSelectSeat(
                              localItemSelectMovie));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 4.0, right: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                            border: Border.all(
                              color: Colors.grey[300],
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                      "${localItemSelectMovie.rowId}排${localItemSelectMovie.columnId}座"),
                                  Text(
                                    "¥$price",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                              Image.memory(
                                base64.decode(
                                    "iVBORw0KGgoAAAANSUhEUgAAABUAAAAVCAYAAACpF6WWAAAAAXNSR0IArs4c6QAAAYJJREFUOBGdlD1ugzAUxzHlHt07gAQod0gPkUZRpQ5Zql6gQw/AVqlShVAP0C1D56x8DDlAT5FMRe7/AQ8Zx4ATS8bG772f3wcPUVXVfV3Xr47j7KIoehNCSOwvGnmeP8BuK6XM4jh+9zrgApRFWZa3EDxeAi6K4hk2CaYDuzusHy5gO3YLBxuAP7EKPptaGajo/ABcu13IKQtswToQsL3neSviNB6RZ52HG4ZDKQ3D0JiKEeAyCIJjD6WNLXgOOIDagG2AZ9ApMGQHRJOQDo0uh33I7Wn7NFbZlIqBUVsUI5D0jFASjIGnPCQ7GvSdGgeMqbMOuhCX/fq+f9LP1fdRqF4UxWg11yBGqA6kkAH9YjC8ney8M6gJiE5ZovPWgFt13qBQY0DuFFPx6CK983roHFAJfbalG6gt0BYs6AcL5YwNqCiUQw6Zz/V1JBUJcv/iArJlA1sg6UNXdrlUi/eEyzwXjwwKR8xvGw/ZAQ1M/4QTGCnmX6NDdFX5mj0YN2z3DxmoW/WF8UdWAAAAAElFTkSuQmCC"),
                                width: 10.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: state.localSelectMovie.length,
                ),
              ),
              //确认按钮
              SafeArea(
                bottom: true,
                child: Container(
                  width: double.infinity,
                  height: 45.0,
                  margin: const EdgeInsets.only(
                      top: 20.0, left: 12, right: 12, bottom: 20),
                  child: RaisedButton(
                    elevation: 0.0,
                    color: state.localSelectMovie.isEmpty
                        ? Color(0x7eFFC000)
                        : of.accentColor,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                    child: Text(state.localSelectMovie.isEmpty
                        ? "请先选择座位"
                        : "¥${state.itemMoney * state.localSelectMovie.length} 确认选座"),
                    textColor: colorWhite,
                    onPressed: () {
                      dispatch(MovieSeatActionCreator.onCommit());
                    },
                  ),
                ),
              )
            ],
          ),
  );
}
