import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/dotline_widget.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:chongmeng/widget/oval_swiper_pagination_builder.dart';
import 'package:extended_image/extended_image.dart';
import 'package:extended_text/extended_text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'action.dart';
import 'state.dart';

var tagSource = {
  'taobao': "淘宝",
  'jingdong': "京东",
  'tianmao': "天猫",
};

Widget buildView(
    ProductDetailsState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var itemData = state.itemData;
  return Scaffold(
      backgroundColor: colorWhite,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: EasyRefresh.custom(
                onRefresh: CompleterUtils.produceCompleterAction(
                  dispatch,
                  ProductDetailsActionCreator.onRefresh,
                ),
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    elevation: 0.0,
                    brightness: Brightness.light,
                    leading: BackButton(
                      color: colorBack,
                    ),
                    backgroundColor: Colors.transparent,
                    expandedHeight: WindowUtils.getScreenWidth(),
                    flexibleSpace: FlexibleSpaceBar(
                      background: buildBanner(itemData, of),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExtendedText.rich(
                              TextSpan(
                                children: <InlineSpan>[
                                  WidgetSpan(
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                      margin: EdgeInsets.only(right: 5.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.0),
                                        ),
                                        border: Border.all(
                                          color: of.accentColor,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Text(
                                        tagSource[state.itemData.type],
                                        style: TextStyle(
                                            color: of.accentColor,
                                            fontSize: 12.0),
                                      ),
                                    ),
                                  ),
                                  TextSpan(text: itemData.title),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "券后价 ",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: of.accentColor)),
                                    TextSpan(
                                        text: "¥${itemData.favourablePrice}",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: of.accentColor)),
                                  ],
                                ),
                              ),
                              Text("已售 ${itemData.volume}件",
                                  style: of.textTheme.caption
                                      .merge(TextStyle(color: colorA4A4A4))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "原价 ¥${itemData.zkFinalPriceWap}",
                                style: of.textTheme.caption
                                    .merge(TextStyle(color: colorA4A4A4)),
                              ),
                            ],
                          ),
                        ),

                        //券金额
                        buildButton(of, itemData, dispatch),
                        if (state.detailsEntity?.data?.storeInfo != null)
                          ...buildShopDetailsWidget(state),
                        if (state.detailsEntity?.data?.pics?.isNotEmpty == true)
                          ...buildDetailsWidget(state)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //底部按钮
            Row(
              children: <Widget>[
                InkResponse(
                  onTap: () {
                    dispatch(ProductDetailsActionCreator.onShare());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.share,
                          color: color7E7E7E,
                          size: 23.0,
                        ),
                        Text(
                          "分享",
                          style: TextStyle(fontSize: 12.0, color: color7E7E7E),
                        )
                      ],
                    ),
                  ),
                ),
                InkResponse(
                  onTap: () {
                    showToast("下期开放");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4.0),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          color: color7E7E7E,
                        ),
                        Text(
                          "收藏",
                          style: TextStyle(fontSize: 12.0, color: color7E7E7E),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      dispatch(ProductDetailsActionCreator.onSkipBuyPage());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 18, right: 18),
                      height: 40.0,
                      decoration: new BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.pink[300], of.accentColor]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "领券购买",
                        style: TextStyle(color: colorWhite),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ));
}

List<Widget> buildShopDetailsWidget(ProductDetailsState state) {
  var storeInfo = state.detailsEntity.data.storeInfo;
  return [
    VerticalLine(
      height: 5.0,
    ),
    Container(
      margin: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
      height: 50.0,
      child: Row(
        children: <Widget>[
          ExtendedImage.network(
            storeInfo.picPath,
            fit: BoxFit.fitHeight,
            enableLoadState: false,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(storeInfo.title),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "宝贝描述: ${storeInfo.shopScore.itemScore}",
                style: TextStyle(color: color333333, fontSize: 13.0),
              ),
              Container(
                width: 20.0,
                alignment: Alignment.center,
                height: 20.0,
                margin: EdgeInsets.only(left: 3.0),
                color: Colors.red,
                child: Text(
                  "高",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colorWhite, fontSize: 13.0),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "卖家服务: ${storeInfo.shopScore.serviceScore}",
                style: TextStyle(color: color333333, fontSize: 13.0),
              ),
              Container(
                width: 20.0,
                alignment: Alignment.center,
                height: 20.0,
                margin: EdgeInsets.only(left: 3.0),
                color: Colors.red,
                child: Text(
                  "高",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colorWhite, fontSize: 13.0),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "物流服务: ${storeInfo.shopScore.deliveryScore}",
                style: TextStyle(color: color333333, fontSize: 13.0),
              ),
              Container(
                width: 20.0,
                alignment: Alignment.center,
                height: 20.0,
                margin: EdgeInsets.only(left: 3.0),
                color: Colors.red,
                child: Text(
                  "高",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colorWhite, fontSize: 13.0),
                ),
              )
            ],
          )
        ],
      ),
    ),
    VerticalLine(
      height: 5.0,
    ),
  ];
}

List<Widget> buildDetailsWidget(ProductDetailsState state) {
  return [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text("宝贝详情"),
    )
  ]..addAll(state.detailsEntity.data.pics
      .map((item) => ExtendedImage.network(
            item,
            enableLoadState: false,
          ))
      .toList());
}

Container buildButton(
    ThemeData of, AliProductItem itemData, Dispatch dispatch) {
  return Container(
    margin: const EdgeInsets.only(top: 15.0, left: 18, right: 18, bottom: 30.0),
    height: 70.0,
    decoration: new BoxDecoration(
      gradient: LinearGradient(colors: [Colors.pink[300], of.accentColor]),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
    ),
    alignment: Alignment.center,
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        dispatch(ProductDetailsActionCreator.onSkipBuyPage());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "¥${itemData.couponValue}",
                        style: TextStyle(fontSize: 24.0, color: colorWhite)),
                    TextSpan(
                        text: "元优惠券",
                        style: TextStyle(fontSize: 14.0, color: colorWhite)),
                  ],
                ),
              ),
              Text(
                "使用期限: ${itemData.couponStartTime}~${itemData.couponEndTime}",
                style: of.textTheme.caption
                    .merge(TextStyle(color: colord9d9d9, fontSize: 12.0)),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Dotline(
              height: 20.0,
              width: 1.5,
              dashHeight: 4.0,
              color: colorWhite,
            ),
          ),
          Text(
            "立即领券",
            style: TextStyle(color: colorWhite),
          ),
        ],
      ),
    ),
  );
}

SizedBox buildBanner(AliProductItem itemData, ThemeData of) {
  return SizedBox(
    width: WindowUtils.getScreenWidth(),
    height: WindowUtils.getScreenWidth(),
    child: new Swiper(
      itemBuilder: (BuildContext context, int index) {
        String itemBanner = itemData.smallImages[index];
        return new ExtendedImage.network(
          itemBanner,
          fit: BoxFit.fill,
          width: WindowUtils.getScreenWidth(),
          height: WindowUtils.getScreenWidth(),
          enableLoadState: false,
        );
      },
      itemCount: itemData.smallImages.length,
      outer: false,
      autoplay: true,
      pagination: new SwiperPagination(
          builder: OvalSwiperPaginationBuilder(
              color: Color(0xffE1DEDE),
              activeColor: of.accentColor,
              activeSize: 20.0)),
    ),
  );
}
