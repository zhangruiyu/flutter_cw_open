import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/shipping_address/model/shipping_address_entity.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ShippingAddressState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    backgroundColor: colorWhite,
    appBar: Toolbar(
      title: Text("收货地址"),
    ),
    body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: EasyRefresh.custom(
              firstRefresh: true,
              firstRefreshWidget: LoadingWidget(),
              onRefresh: CompleterUtils.produceCompleterAction(
                dispatch,
                ShippingAddressActionCreator.onRefresh,
              ),
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return buildItem(
                        of, state.data[index], viewService.context, state);
                  }, childCount: state.data?.length ?? 0),
                )
              ],
            ),
          ),
          Container(
            width: WindowUtils.getScreenWidth() - 38 * 2,
            height: 45.0,
            margin: const EdgeInsets.only(
                top: 22.0, left: 38, right: 38, bottom: 20.0),
            child: RaisedButton(
              elevation: 0.0,
              color: of.accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: Text("新建地址"),
              textColor: colorWhite,
              onPressed: () {
                dispatch(ShippingAddressActionCreator.onSkipAddAddress());
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildItem(ThemeData of, ShippingAddressData data, BuildContext context,
    ShippingAddressState state) {
  return InkWell(
    onTap: state.type == ShippingAddressState.SEE
        ? null
        : () {
            Navigator.pop(context, data);
          },
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(data.consignee),
                  Text(data.tel),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  data.provincename + data.cityname + data.areaname,
                  style: of.textTheme.caption,
                ),
              ),
              Text(
                data.addressDetails,
                style: of.textTheme.caption,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: VerticalLine(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton.icon(
                    icon: Icon(
                      MdiIcons.playlistEdit,
                    ),
                    label: Text("编辑"),
                    onPressed: () {
                      showToast("暂未开放");
                    },
                  ),
                  FlatButton.icon(
                    icon: Icon(
                      MdiIcons.deleteOutline,
                    ),
                    label: Text("删除"),
                    onPressed: () {
                      showToast("暂未开放");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        VerticalLine(
          height: 5.0,
        )
      ],
    ),
  );
}
