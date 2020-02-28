import 'package:chongmeng/anim/slide_transition_x.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/store/model/integral_commodity_entity.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CouponDetailState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var itemData = state.itemData;
  return Scaffold(
//    backgroundColor: of.accentColor,
    appBar: Toolbar(
      title: Text(itemData.title),
    ),
    floatingActionButton: FloatingActionButton(
      elevation: 0.0,
      onPressed: () {
        dispatch(CouponDetailActionCreator.onShare());
      },
      child: Text(
        "赚",
        style: TextStyle(color: colorWhite, fontSize: 20),
      ),
      backgroundColor: Colors.red,
    ),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
              margin: const EdgeInsets.all(12.0),
              color: colorWhite,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedSwitcher(
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    var tween =
                        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                    return SlideTransitionX(
                      child: child,
                      direction: AxisDirection.left, //上入下出
                      position: animation,
                    );
                  },
                  duration: Duration(milliseconds: 500),
                  child: state.data?.isNotEmpty == true
                      ? Container(
                          key: ValueKey("show"),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                    "恭喜您,消耗${state.itemData.integralPrice}积分兑换成功"),
                              ),
                              ...state.data.map((itemCoupon) {
                                return Container(
                                    width: double.infinity,
                                    height: 45.0,
                                    margin: const EdgeInsets.only(
                                        top: 22.0, left: 38, right: 38),
                                    child: RaisedButton(
                                      color: of.accentColor,
                                      onPressed: () {
                                        dispatch(CouponDetailActionCreator
                                            .onGetCoupon());
                                      },
                                      child: Text(
                                        "${state.data.indexOf(itemCoupon) + 1}, 满${itemCoupon.threshold}减${itemCoupon.amount} ${itemCoupon.title}",
                                        style: TextStyle(color: colorWhite),
                                      ),
                                    ));
                              }).toList(),
                              Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  margin: const EdgeInsets.only(
                                      top: 22.0, left: 38, right: 38),
                                  child: RaisedButton(
                                    color: of.accentColor,
                                    onPressed: () {
                                      dispatch(
                                          CouponDetailActionCreator.onSetCoupon(
                                              null));
                                      state.telEditingController.clear();
                                    },
                                    child: Text(
                                      "换其他手机号再领一次",
                                      style: TextStyle(color: colorWhite),
                                    ),
                                  )),
                              Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  margin: const EdgeInsets.only(
                                      top: 22.0, left: 38, right: 38),
                                  child: RaisedButton(
                                    color: of.accentColor,
                                    onPressed: () {
                                      dispatch(CouponDetailActionCreator
                                          .onOpenEleme());
                                    },
                                    child: Text(
                                      "打开饿了吗,立即使用",
                                      style: TextStyle(color: colorWhite),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      : Column(
                          key: ValueKey("get"),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ...state.itemData.types
                                .map((IntegralCommodityDataElemoType itemType) {
                              var indexOf =
                                  state.itemData.types.indexOf(itemType);
                              return GestureDetector(
                                onTap: () {
                                  dispatch(CouponDetailActionCreator
                                      .onChangeSelectPosition(indexOf));
                                },
                                child: AnimatedContainer(
                                  color: (indexOf == state.position)
                                      ? colord9d9d9
                                      : colorF6F6F6,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                  duration: Duration(milliseconds: 500),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              itemType.title,
                                              textAlign: TextAlign.start,
                                            ),
                                            if (indexOf == state.position)
                                              Text(
                                                itemType.content,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: color7E7E7E),
                                                textAlign: TextAlign.start,
                                              )
                                          ],
                                        ),
                                      ),
                                      if (indexOf == state.position)
                                        Checkbox(
                                          onChanged: (bool value) {},
                                          value: indexOf == state.position,
                                        )
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Text(
                                "请输入您的饿了么手机号",
                                style: TextStyle(color: color7E7E7E),
                              ),
                            ),
                            TextField(
                              controller: state.telEditingController,
                              textInputAction: TextInputAction.go,
                              onSubmitted: (str) {
                                dispatch(
                                    CouponDetailActionCreator.onGetCoupon());
                              },
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    state.telEditingController.clear();
                                  },
                                  child: Icon(Icons.clear),
                                ),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Color(0xfff1f1f1),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    )),
                              ),
                              autofocus: true,
                              maxLines: 1,
                              maxLength: 11,
                              buildCounter: (BuildContext context,
                                      {int currentLength,
                                      int maxLength,
                                      bool isFocused}) =>
                                  null,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(fontSize: 17.0),
                            ),
                            if (state.positionType ==
                                state.itemData.types[state.position].type)
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Text(
                                  "请输入收到的饿了么验证码",
                                  style: TextStyle(color: color7E7E7E),
                                ),
                              ),
                            if (state.positionType ==
                                state.itemData.types[state.position].type)
                              TextField(
                                focusNode: state.codeFocusNode,
                                controller: state.codeEditingController,
                                textInputAction: TextInputAction.go,
                                onSubmitted: (str) {
                                  dispatch(
                                      CouponDetailActionCreator.onGetCoupon());
                                },
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      state.codeEditingController.clear();
                                    },
                                    child: Icon(Icons.clear),
                                  ),
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Color(0xfff1f1f1),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      )),
                                ),
                                autofocus: true,
                                maxLines: 1,
                                maxLength: 6,
                                buildCounter: (BuildContext context,
                                        {int currentLength,
                                        int maxLength,
                                        bool isFocused}) =>
                                    null,
                                keyboardType: TextInputType.phone,
                                style: TextStyle(fontSize: 17.0),
                              ),
                            Container(
                                width: double.infinity,
                                height: 45.0,
                                margin: const EdgeInsets.only(
                                    top: 22.0, left: 38, right: 38),
                                child: RaisedButton(
                                  color: of.accentColor,
                                  onPressed: () {
                                    dispatch(CouponDetailActionCreator
                                        .onGetCoupon());
                                  },
                                  child: Text(
                                    "马上领取",
                                    style: TextStyle(color: colorWhite),
                                  ),
                                ))
                          ],
                        ),
                ),
              )),
          Card(
            margin: const EdgeInsets.all(12.0),
            color: of.accentColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text(
                        "不是100%成功，若一直失败联系客服。" + "若在高峰期领，到账会延迟几分钟，耐心等待。",
                        style: TextStyle(color: colorWhite),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 20.0),
                    child: VerticalLine(
                      height: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      """1、每次领取红包需要花费${state.itemData.integralPrice}萌币，失败不扣萌币，领取后在[饿了么APP]内查看，不要用小程序。""",
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      """2、部分不是100%成功，少量手机号有问题会领取失败，换个手机号试试。一直失败的话，联系客服协助您解决。""",
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      """3、在选择红包时，请查看对应的规则。领过的请明天再来，或换手机号再试。""",
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "4、客服QQ群（有问题随时联系）：609487304",
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "领取成功和使用示例(如下)",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ExtendedImage.network(
            itemData.pic,
            enableLoadState: false,
          ),
          ExtendedImage.network(
            "https://chomgwo-1253631018.cos.ap-beijing.myqcloud.com/eleme/instructions.jpeg",
            enableLoadState: false,
          )
        ],
      ),
    ),
  );
}
