import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/color_utils.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/empty_widget.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TallyState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("记一笔"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(TallyActionCreator.onSkipAddTallyPage());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "添加",
                style: TextStyle(color: colorWhite),
              ),
            ),
          ),
        )
      ],
    ),
    body: EasyRefresh.custom(
      firstRefresh: true,
      firstRefreshWidget: LoadingWidget(),
      emptyWidget: state.data?.isEmpty == true ? EmptyWidget() : null,
      controller:
          state.data?.isEmpty == true ? state.easyRefreshController : null,
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        TallyActionCreator.onRefresh,
      ),
      /* onLoad: CompleterUtils.produceCompleterAction(
          dispatch, CommunityActionCreator.onLoadMore,
          params: (Map<String, dynamic> p) {
        p['filtrateType'] = page.filtrateType;
      }),*/
      slivers: <Widget>[
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            var itemData = state.data[index];

            return Column(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            itemData.image == null
                                ? Container()
                                : ExtendedImage.network(
                                    itemData.image,
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                    enableLoadState: false,
                                  ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children:
                                          itemData.tagNames.map((itemTag) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Chip(
                                            label: Text(
                                              itemTag,
                                              style:
                                                  TextStyle(color: colorWhite),
                                            ),
                                            backgroundColor:
                                                ColorUtils.randomColor((index +
                                                        itemData.tagNames
                                                            .indexOf(itemTag))
                                                    .toString()),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    itemData.remake == null
                                        ? null
                                        : Text(itemData.remake),
                                  ].where((obj) => obj != null).toList(),
                                ),
                              ),
                            ),
                            Text(itemData.price == null
                                ? ""
                                : "${itemData.price}¥"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: "预计时间: ",
                                children: [
                                  TextSpan(
                                    text: itemData.takeDate,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Theme.of(viewService.context)
                                            .accentColor),
                                  ),
                                ],
                                style: TextStyle(
                                    fontSize: 12.0, color: color343434),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "创建时间: ",
                                children: [
                                  TextSpan(
                                    text: itemData.createTime,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Theme.of(viewService.context)
                                            .accentColor),
                                  ),
                                ],
                                style: TextStyle(
                                    fontSize: 12.0, color: color343434),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                index == state.data.length - 1
                    ? Container()
                    : VerticalLine(
                        height: 10.0,
                      )
              ],
            );
          }, childCount: state.data?.length ?? 0),
        ),
      ],
    ),
  );
}
