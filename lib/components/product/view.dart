import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';

Widget buildView(
    AliProductItem state, Dispatch dispatch, ViewService viewService) {
  var themeData = Theme.of(viewService.context);
  var itemData = state;
  return Container(
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: themeData.dividerColor,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      color: colorWhite,
    ),
    child: InkWell(
      onTap: () {
        dispatch(AliItemProductActionCreator.onSkipProductDetailsPage());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ExtendedImage.network(
                itemData.pictUrl,
                fit: BoxFit.fill,
                width: 120.0,
                height: 120.0,
                enableLoadState: false,
              ),
            ),
            Expanded(
              child: Container(
                height: 120.0,
                padding:
                    const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      itemData.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "原价 ¥${itemData.zkFinalPriceWap}",
                              style: themeData.textTheme.caption
                                  .merge(TextStyle(color: colorA4A4A4)),
                            ),
                            Text("已售 ${itemData.volume}件",
                                style: themeData.textTheme.caption
                                    .merge(TextStyle(color: colorA4A4A4))),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "券后价 ",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: color343434)),
                                    TextSpan(
                                        text: "¥${itemData.favourablePrice}",
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: color343434)),
                                  ],
                                ),
                              ),
                              Container(
                                height: 25.0,
                                child: OutlineButton(
                                  disabledBorderColor: themeData.accentColor,
                                  child: Text(
                                    '${itemData.couponValue}元',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: themeData.accentColor),
                                  ),
                                  onPressed: null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
