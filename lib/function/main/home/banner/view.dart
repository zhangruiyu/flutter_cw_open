import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/widget/oval_swiper_pagination_builder.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    BannerState state, Dispatch dispatch, ViewService viewService) {
  var accentColor = Theme.of(viewService.context).accentColor;
  return state.bannerData == null
      ? Container()
      : Container(
          height: 194.0,
          child:
              /*(state?.bannerData?.banners?.length ?? 0) == 0
          ? Container()
          : */
              new Swiper(
            itemBuilder: (BuildContext context, int index) {
              AliProductItem itemBanner = state.bannerData[index];
              return GestureDetector(
                onTap: () {
                  dispatch(BannerActionCreator.onSkipWebViewPage(itemBanner));
                },
                child: Container(
                  height: 150.0,
                  child: new ExtendedImage.network(
                    itemBanner.pictUrl,
                    fit: BoxFit.fill,
                    enableLoadState: false,
                  ),
                ),
              );
            },
            itemCount: state.bannerData.length,
//        viewportFraction: 0.8,
//        scale: 0.75,
            outer: false,
            autoplay: true,
            pagination: new SwiperPagination(
                builder: OvalSwiperPaginationBuilder(
                    color: Color(0xffE1DEDE),
                    activeColor: accentColor,
                    activeSize: 20.0)),
//        layout: SwiperLayout.STACK,
//        control: new SwiperControl(),
          ));
}
