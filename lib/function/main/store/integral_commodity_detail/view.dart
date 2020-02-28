import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/store/integral_component/view.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/commodity_count.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(IntegralCommodityDetailState state, Dispatch dispatch,
    ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    backgroundColor: colorWhite,
    appBar: Toolbar(
      title: Text("商品详情"),
    ),
    body: Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  transitionOnUserGestures: true,
                  tag: state.index.toString(),
                  child: ExtendedImage.network(
                    state.itemData.pic[0],
                    fit: BoxFit.cover,
                    width: WindowUtils.getScreenWidth(),
                    height: WindowUtils.getScreenWidth(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(state.itemData.name),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "库存${state.itemData.count}件",
                          style: of.textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalLine(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("兑换数量"),
                      CommodityCount(
                        commodityCountController:
                            state.commodityCountController,
                        initCount: 1,
                        maxCount: state.itemData.count,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 18.0, left: 18.0, right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("可用萌币"),
                      Text(state.totalIntegral == null
                          ? "正在获取"
                          : state.totalIntegral.toString()),
                    ],
                  ),
                ),
                VerticalLine(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 18.0, right: 18.0, bottom: 5.0),
                  child: Text("使用说明"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 18.0, bottom: 18.0),
                  child: Text(
                    state.itemData.externalRemake,
                    style: of.textTheme.caption,
                  ),
                ),
                VerticalLine(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, left: 18.0, right: 18.0, bottom: 5.0),
                  child: Text("商品简介"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Text(
                    state.itemData.details,
                    style: of.textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 18.0),
                  child: Text(
                    "发货时间",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Text(
                    "代金券:商品兑换成功后会在30分钟内根据您所填写的手机号发放后进行提示。",
                    style: of.textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Text(
                    "实物:商品兑换成功后会在每周五根据您所填写的默认地址统一邮寄发放。",
                    style: of.textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 18.0),
                  child: Text(
                    "填写地址",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Text(
                    "使用手机的用户,请打开宠窝APP,进入账户页-收货地址-去设置您的收货地址",
                    style: of.textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 18.0),
                  child: Text(
                    "免责声明",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, right: 18.0, bottom: 10.0),
                  child: Text(
                    "编写者(即张大头同学)拥有本活动最终解释权",
                    style: of.textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
        ),
        new Container(
          width: WindowUtils.getScreenWidth(),
          height: 50.0 + MediaQuery.of(viewService.context).padding.bottom,
          child: new RaisedButton(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(viewService.context).padding.bottom),
              child: new Text(
                '${state.itemData.integralPrice}萌币兑换',
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 18.0, color: colorWhite),
              ),
            ),
            onPressed: () async {
              dispatch(IntegralCommodityDetailActionCreator.onBuy());
            },
            color: Theme.of(viewService.context).accentColor,
          ),
        )
      ],
    ),
  );
}
