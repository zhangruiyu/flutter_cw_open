import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/oval_swiper_pagination_builder.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AdoptionDetailsState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  var data = state.data;
  var bottomHeight = 50.0 + MediaQuery.of(viewService.context).padding.bottom;
  List<dynamic> chipShow = [];
  if (data.sex == 1) {
    chipShow.add({
      "color": Colors.blue,
      "image": "assets/adoption_immune_sex_m.png",
      "text": data.isSterilization ? "已绝育" : "未绝育",
    });
  } else if (data.sex == 0) {
    chipShow.add({
      "color": Colors.pinkAccent,
      "image": "assets/adoption_immune_sex_w.png",
      "text": data.isSterilization ? "已绝育" : "未绝育",
    });
  }
  chipShow.add({
    "color": Colors.green,
    "image": "assets/adoption_expelling_parasite.png",
    "text": data.isExpellingParasite ? "已驱虫" : "未驱虫",
  });
  chipShow.add({
    "color": Colors.brown,
    "image": "assets/adoption_age.png",
    "text": data.age,
  });
  return Scaffold(
    appBar: Toolbar(
      title: Text("宠物详情"),
    ),
    body: Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: bottomHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 194.0,
                    child:
                        /*(state?.bannerData?.banners?.length ?? 0) == 0
                  ? Container()
                  : */
                        new Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 150.0,
                          child: new ExtendedImage.network(
                            state.data.pic[index],
                            fit: BoxFit.cover,
                            enableLoadState: false,
                          ),
                        );
                      },
                      itemCount: state.data?.pic?.length,
                      outer: false,
                      autoplay: true,
                      pagination: new SwiperPagination(
                          builder: OvalSwiperPaginationBuilder(
                              color: Color(0xffE1DEDE),
                              activeColor: of.accentColor,
                              activeSize: 20.0)),
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(data.petName),
                              if (data.isImmune)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Image.asset(
                                    "assets/adoption_immune.png",
                                    width: 15.0,
                                  ),
                                )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                                data.provincename +
                                    data.cityname +
                                    data.areaname,
                                style: of.textTheme.caption),
                          ),
                          SizedBox(
                            height: 30.0,
                            child: Row(
                              children: chipShow.map((itemChip) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      color: itemChip['color']),
                                  margin: EdgeInsets.only(right: 10.0),
                                  padding:
                                      EdgeInsets.only(left: 5.0, right: 5.0),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        itemChip['image'],
                                        width: 13.0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 2.0),
                                        child: Text(
                                          itemChip['text'],
                                          style: TextStyle(
                                              fontSize: 11.0,
                                              color: colorWhite),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                VerticalLine(),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                  child: Text(
                    "宠物描述",
                    style: of.textTheme.title,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, top: 3.0, bottom: 10.0),
                  child: Text(data.description),
                ),
                VerticalLine(),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10.0),
                  child: Text(
                    "领养要求",
                    style: of.textTheme.title,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, top: 3.0, bottom: 10.0),
                  child: Text(data.request),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 30.0),
                  child: Text(
                      "如有发现收费领养、虚假信息、以空运费为由支付费用的，一定不要相信请立刻联系平台(加入QQ群:609487304),核实后我们会将其永久加入黑"),
                ),
              ],
            ),
          ),
        ),
        new Container(
          width: WindowUtils.getScreenWidth(),
          height: bottomHeight,
          child: new RaisedButton(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(viewService.context).padding.bottom),
              child: new Text(
                '带Ta回家',
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 18.0, color: colorWhite),
              ),
            ),
            onPressed: () async {
              dispatch(AdoptionDetailsActionCreator.onShowAdoptionDialog());
            },
            color: Theme.of(viewService.context).accentColor,
          ),
        ),
      ],
    ),
  );
}
