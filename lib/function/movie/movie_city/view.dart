import 'package:azlistview/azlistview.dart';
import 'package:chongmeng/function/my_pet/selectsubtype/model/pet_sub_type_entity.dart';
import 'package:chongmeng/function/my_pet/selectsubtype/view.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:lpinyin/lpinyin.dart';

import 'action.dart';
import 'model/cinema_city_entity.dart';
import 'state.dart';

int _suspensionHeight = 40;
int _itemHeight = 50;

Widget buildView(
    MovieCityState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: Toolbar(
        title: Text("选择城市"),
      ),
      body: state.hotCity == null
          ? EasyRefresh.custom(
              firstRefresh: true,
              firstRefreshWidget: LoadingWidget(),
              onRefresh: CompleterUtils.produceCompleterAction(
                dispatch,
                MovieCityActionCreator.onRefresh,
              ),
              slivers: <Widget>[],
            )
          : Column(
              children: <Widget>[
                ListTile(
                    onTap: () {
                      Navigator.pop(viewService.context,
                          state.location == null ? null : state.districtText);
                    },
                    title: Text("当前城市"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.place,
                          size: 20.0,
                        ),
                        Text(" ${state.districtText}"),
                      ],
                    )),
                Divider(
                  height: .0,
                ),
                Expanded(
                  child: AzListView(
                    data: state.allCity,
                    header: AzListViewHeader(
                        tag: "★",
                        height: 160,
                        builder: (context) {
                          return _buildHeader(state.hotCity, dispatch);
                        }),
                    itemBuilder: (context, model) =>
                        _buildListItem(model, dispatch),
                    suspensionWidget: (_buildSusWidget)(state.suspensionTag),
                    isUseRealIndex: true,
                    itemHeight: _itemHeight,
                    suspensionHeight: _suspensionHeight,
                    onSusTagChanged: (String tag) {
                      dispatch(MovieCityActionCreator.onChangeTag(tag));
                    },
                    indexHintBuilder: (context, hint) {
                      return Container(
                        alignment: Alignment.center,
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                            color: Colors.black54, shape: BoxShape.circle),
                        child: Text(hint,
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0)),
                      );
                    },
                  ),
                ),
              ],
            ));
}

Widget _buildHeader(List<CinemaCitySuspensionBean> hotCity, Dispatch dispatch) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
    child: Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      spacing: 10.0,
      children: hotCity.map((e) {
        return OutlineButton(
          borderSide: BorderSide(color: Colors.grey[300], width: .5),
          child: Text(e.name),
          onPressed: () {
            dispatch(MovieCityActionCreator.onSelectCity(e.id, e.name));
          },
        );
      }).toList(),
    ),
  );
}

Widget _buildSusWidget(String susTag) {
  return Container(
    height: _suspensionHeight.toDouble(),
    padding: const EdgeInsets.only(left: 15.0),
    color: Color(0xfff3f4f5),
    alignment: Alignment.centerLeft,
    child: Text(
      '$susTag',
      softWrap: false,
      style: TextStyle(
        fontSize: 14.0,
        color: Color(0xff999999),
      ),
    ),
  );
}

Widget _buildListItem(CinemaCitySuspensionBean model, Dispatch dispatch) {
  String susTag = model.getSuspensionTag();
  return Column(
    children: <Widget>[
      Offstage(
        offstage: model.isShowSuspension != true,
        child: _buildSusWidget(susTag),
      ),
      SizedBox(
        height: _itemHeight.toDouble(),
        child: ListTile(
          title: Text(model.name),
          onTap: () {
            dispatch(MovieCityActionCreator.onSelectCity(model.id, model.name));
          },
        ),
      )
    ],
  );
}
