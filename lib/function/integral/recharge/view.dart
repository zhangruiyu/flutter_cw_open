import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    RechargeState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    appBar: Toolbar(
      title: Text("充值萌币喽"),
    ),
    body: EasyRefresh.custom(
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        RechargeActionCreator.onRefresh,
      ),
      firstRefreshWidget: LoadingWidget(),
      firstRefresh: true,
      slivers: <Widget>[
        if (state.data != null)
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38.0, left: 20),
                    child: Text(
                      "充值金额",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: state.moneyTextEditingController,
                    autofocus: true,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    inputFormatters: [LengthLimitingTextInputFormatter(7)],
                    decoration: InputDecoration(
                        prefixText: "¥",
                        prefixStyle: TextStyle(color: colorBack, fontSize: 25)),
                  ),
                ),
                //充值选项
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Wrap(
                    children: state.data.map((itemRecharge) {
                      var index = state.data.indexOf(itemRecharge);
                      bool isSelect = index == state.selectItemPosition;
                      return InkWell(
                        onTap: () {
                          dispatch(RechargeActionCreator.onChangeSelectPosition(
                              index));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
//                            color:
//                                isSelect ? Colors.black.withOpacity(0.5) : null,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 2,
                                  color: isSelect
                                      ? Theme.of(viewService.context)
                                          .accentColor
                                      : Theme.of(viewService.context)
                                          .dividerColor)),
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 18.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 10),
                          width: WindowUtils.getScreenWidth() / 3 - 40,
                          child: Text("¥ ${itemRecharge.showMoney}"),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Text(
                  "充值成功后,即可直接使用兑换商品",
                  style: TextStyle(fontSize: 13.0, color: color7E7E7E),
                ),
                Container(
                  width: WindowUtils.getScreenWidth() - 38 * 2,
                  height: 45.0,
                  margin: const EdgeInsets.only(top: 22.0, left: 38, right: 38),
                  child: RaisedButton(
                    elevation: 0.0,
                    color: of.accentColor,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(22.0)),
                    child: Text("立即充值"),
                    textColor: colorWhite,
                    onPressed: () {
                      dispatch(RechargeActionCreator.onPay());
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
