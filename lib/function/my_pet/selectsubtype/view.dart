import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:azlistview/azlistview.dart';
import 'package:lpinyin/lpinyin.dart';
import 'action.dart';
import 'state.dart';

int _suspensionHeight = 30;

Widget buildView(
    SelectSubTypeState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("选择品种"),
    ),
    body: AzListView(
      data: state.petSubList,
      itemBuilder: (context, model) => _buildListItem(model, dispatch, state),
//      suspensionWidget: _buildSusWidget(state.suspensionTag),
      isUseRealIndex: true,
      itemHeight: 50,
      suspensionHeight: _suspensionHeight,
//          onSusTagChanged: _onSusTagChanged,
      //showCenterTip: false,
    ),
  );
}

_buildListItem(
    ISuspensionBean model, Dispatch dispatch, SelectSubTypeState state) {
  var info = model as CityInfo;
  return ListTile(
    onTap: () {
      dispatch(SelectSubTypeActionCreator.onSelectSubType({
        'key': info.name,
        'value': {'pet_sub_type': info.id, 'pet_type_id': state.id}
      }));
    },
    title: Text(info.name),
  );
}

Widget _buildSusWidget(String susTag) {
  susTag = (susTag == "★" ? "热门城市" : susTag);
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

class CityInfo extends ISuspensionBean {
  String name;
  String tagIndex;
  String image;
  int id;

  String namePinyin;

  CityInfo({this.name, this.tagIndex, this.image, this.id});

  @override
  String getSuspensionTag() {
    return namePinyin.substring(0, 1).toUpperCase();
  }
}
