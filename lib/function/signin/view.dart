import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:table_calendar/table_calendar.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SignInState state, Dispatch dispatch, ViewService viewService) {
  var accentColor = Theme.of(viewService.context).accentColor;
  var bgColor = Color(0xffF03E51);
  return Scaffold(
    backgroundColor: bgColor,
    appBar: Toolbar(
      title: Text("签到"),
      backgroundColor: accentColor,
    ),
    body: EasyRefresh.custom(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Image.asset(
              "assets/signin_page_banner.png",
              fit: BoxFit.fitWidth,
            ),
            state.markers.keys.contains(DateUtils.toDayDateTime())
                ? Container()
                : Card(
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 13.0, right: 13.0, top: 23.0, bottom: 23.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("快来翻盘签到吧",
                              style: TextStyle(
                                  fontSize: 18.0, color: color333333)),
                          Text("点击翻盘100%中奖",
                              style: TextStyle(
                                  fontSize: 12.0, color: color999999)),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: GridView(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                children: List.generate(3, (i) => i.toString())
                                    .map((item) {
                                  return GestureDetector(
                                      onTap: () {
                                        dispatch(SignInActionCreator.onSign());
                                      },
                                      child: Image.asset(
                                          "assets/signin_page_sign_item_bg.png"));
                                }).toList()),
                          )
                        ],
                      ),
                    ),
                  ),
            Card(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              text: "已连续签到",
                              style: TextStyle(
                                fontSize: 18.0,
//                                  fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                    text: (state.data?.signList?.signCount ?? 0)
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: accentColor)),
                                TextSpan(
                                    text: "天",
                                    style: TextStyle(
                                        fontSize: 18.0,
//                                  fontWeight: FontWeight.bold,
                                        color: Colors.black))
                              ]),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(viewService.context,
                                PageConstants.IntegralRecordPage);
                          },
                          child: Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "我的萌币 ",
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.black)),
                                  TextSpan(
                                      text: (state.data?.totalIntegral ?? 0)
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 15.0, color: accentColor)),
                                ]),
                              ),
                              Icon(
                                MdiIcons.chevronRight,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "当前签到金币提升至 ",
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                          TextSpan(
                              text: "${state.data.multiple}%",
                              style: TextStyle(
                                  fontSize: 15.0, color: accentColor)),
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0, top: 10.0),
                    child: LinearProgressIndicator(
                        value: state.data.multiple / 20.0,
                        valueColor: new AlwaysStoppedAnimation<Color>(bgColor),
                        backgroundColor:
                            Theme.of(viewService.context).accentColor),
                  )
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: TableCalendar(
                locale: "zh",
                holidays: state.markers,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: const TextStyle(
                      color: const Color(0xFF616161)), // Material grey[700]
                  weekendStyle: const TextStyle(color: const Color(0xFF616161)),
                ),
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  weekendStyle: const TextStyle(color: const Color(0xFF616161)),
                  holidayStyle: const TextStyle(color: const Color(0xFF616161)),
                ),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonVisible: false,
                ),
                builders: CalendarBuilders(markersBuilder:
                    (BuildContext context, DateTime date, List events,
                        List holidays) {
                  final children = <Widget>[];
                  children.add(
                    Icon(
                      Icons.check,
                      color: accentColor,
                    ),
                  );
                  return children;
                }),
                calendarController: state.calendarController,
              ),
            )
          ]),
        )
      ],
    ),
  );
}
