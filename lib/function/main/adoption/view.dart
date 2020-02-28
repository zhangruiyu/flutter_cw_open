import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/function/adoption/adoption_add/state.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'model/adoption_entity.dart';
import 'state.dart';

Widget buildView(
    AdoptionState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
        title: Text("领送养中心"),
        automaticallyImplyLeading: false,
        leading: null,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: InkResponse(
              onTap: () {
                UserHelper.loginCheck(viewService.context, () {
                  Navigator.pushNamed(
                      viewService.context, PageConstants.AdoptionAddPage,
                      arguments: {'adoptionAction': AdoptionBackendAction.add});
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "发布更多",
                  style: TextStyle(color: colorWhite),
                ),
              ),
            ),
          )
        ]),
    body: EasyRefresh.custom(
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        AdoptionActionCreator.onRefresh,
      ),
      firstRefreshWidget: LoadingWidget(),
      firstRefresh: true,
      slivers: <Widget>[
        if (state.data != null)
          SliverToBoxAdapter(
            child: ExtendedImage.network(
              state.data.image,
              fit: BoxFit.fitWidth,
              enableLoadState: false,
            ),
          ),
        /* SliverToBoxAdapter(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[Text("省份"), Text("不限")],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[Text("城市"), Text("不限")],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[Text("县"), Text("不限")],
                ),
              ),
            ],
          ),
        ),*/
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            var data = state.data.adoption[index];
            return buildItem(state, dispatch, viewService, data);
          }, childCount: state.data?.adoption?.length ?? 0),
        )
      ],
    ),
  );
}

Widget buildItem(AdoptionState state, Dispatch dispatch,
    ViewService viewService, AdoptionDataAdoption data) {
  var of = Theme.of(viewService.context);
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
  return InkWell(
    onTap: () {
      dispatch(AdoptionActionCreator.onSkipDetailsPage(data));
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
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
                        data.provincename + data.cityname + data.areaname,
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
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                itemChip['image'],
                                width: 13.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: Text(
                                  itemChip['text'],
                                  style: TextStyle(
                                      fontSize: 11.0, color: colorWhite),
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
              ClipOval(
                  child: ExtendedImage.network(
                data.pic[0],
                width: 70.0,
                height: 70.0,
                fit: BoxFit.cover,
                enableLoadState: false,
              )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
            child: Text(
              data.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    color: of.accentColor),
                margin: EdgeInsets.only(right: 10.0),
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    data.adoptionType == 0
                        ? "无偿"
                        : data.adoptionType == 1
                            ? "押金领养"
                            : data.adoptionType == 2 ? "有偿领养" : "",
                    style: TextStyle(fontSize: 11.0, color: colorWhite),
                  ),
                ),
              ),
              if (data.adoptionType != 0)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      color: of.accentColor),
                  margin: EdgeInsets.only(right: 10.0),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text(
                      data.money.toString() + "元",
                      style: TextStyle(fontSize: 11.0, color: colorWhite),
                    ),
                  ),
                ),
              if (data.adoptionType == 1)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      color: of.accentColor),
                  margin: EdgeInsets.only(right: 10.0),
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text(
                      data.cashPledgeDeadline + "内归还押金",
                      style: TextStyle(fontSize: 11.0, color: colorWhite),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: VerticalLine(),
          )
        ],
      ),
    ),
  );
}
