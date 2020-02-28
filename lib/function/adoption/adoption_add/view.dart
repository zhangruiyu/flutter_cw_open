import 'dart:io';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:chongmeng/function/tally/add/action.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AdoptionAddState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    appBar: Toolbar(
      title: Text(state.adoptionAction == AdoptionBackendAction.add
          ? "送养信息"
          : "修改送养信息"),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                "完善详细信息,帮助毛孩子们进入一个温馨的家吧",
                style: of.textTheme.body2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("宠物信息"),
          ),
          Card(
            color: colorWhite,
            child: Column(
              children: <Widget>[
                ...buildItem("种类", "请选择宠物种类",
                    hasArrow: true,
                    textEditingController: state.petTypeIdTextEditingController,
                    onTap: () {
                  dispatch(AdoptionAddActionCreator.onSelectType("petTypeId"));
                }, dispatch: dispatch, viewService: viewService),
                ...buildItem("名字", "请填写宠物名字或品种",
                    hasArrow: false,
                    canEdit: true,
                    textEditingController: state.petNameTextEditingController,
                    dispatch: dispatch,
                    viewService: viewService),
                ...buildItem("性别", "请选择宠物性别", hasArrow: true, onTap: () {
                  dispatch(AdoptionAddActionCreator.onSelectType("sex"));
                },
                    textEditingController: state.sexTextEditingController,
                    dispatch: dispatch,
                    viewService: viewService),
                ...buildItem("年龄(月)", "请填写宠物几个月",
                    hasArrow: false,
                    keyboardType: TextInputType.number,
                    textEditingController: state.ageTextEditingController,
                    canEdit: true,
                    dispatch: dispatch,
                    viewService: viewService),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("是否免费"),
          ),
          buildMoneyWidget(state, dispatch, viewService),
          buildSafeWidget(state, dispatch, viewService),
          ...buildDescriptionWidget(state, dispatch, viewService),
          ...buildMasterWidget(state, dispatch, viewService),
          Container(
            width: WindowUtils.getScreenWidth() - 38 * 2,
            height: 45.0,
            margin: const EdgeInsets.only(
                top: 22.0, left: 38, right: 38, bottom: 60.0),
            child: RaisedButton(
              elevation: 0.0,
              color: Theme.of(viewService.context).accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: Text(state.adoptionAction == AdoptionBackendAction.add
                  ? "提交"
                  : "确认修改"),
              textColor: colorWhite,
              onPressed: () {
                dispatch(AdoptionAddActionCreator.onCommit());
              },
            ),
          ),
        ],
      ),
    ),
  );
}

//宠物详情部分
List<Widget> buildDescriptionWidget(
    AdoptionAddState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("宠物照片(最多5张)和描述(性格爱好等)"),
    ),
    Card(
      color: colorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: buildPicWidget(
                        state: state,
                        dispatch: dispatch,
                        viewService: viewService)
                    .toList(),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 10.0),
                child: Text(
                  "描述:",
                  style: of.textTheme.subhead,
                ),
              ),
              Expanded(
                child: TextField(
                  maxLines: 5,
                  maxLength: 300,
                  buildCounter: (BuildContext context,
                          {int currentLength, int maxLength, bool isFocused}) =>
                      null,
                  controller: state.descriptionTextEditingController,
                  decoration: InputDecoration(
                      hintText: "请填写宠物描述(300字以内)", border: InputBorder.none),
                ),
              ),
            ],
          )
        ],
      ),
    ),
    //
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("领养要求(是否需要家访一次等,请描述清楚)"),
    ),
    Card(
      color: colorWhite,
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0, left: 10.0),
        child: TextField(
          maxLines: 5,
          controller: state.requestTextEditingController,
          maxLength: 300,
          buildCounter: (BuildContext context,
                  {int currentLength, int maxLength, bool isFocused}) =>
              null,
          decoration: InputDecoration(
              hintText: "请填写领养要求(300字以内)", border: InputBorder.none),
        ),
      ),
    )
  ];
}

//送养人描述
List<Widget> buildMasterWidget(
    AdoptionAddState state, Dispatch dispatch, ViewService viewService) {
  return [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("主人信息"),
    ),
    Card(
      color: colorWhite,
      child: Column(
        children: <Widget>[
          ...buildItem("送养人", "请填写送养人姓名,例如:赵先生",
              hasArrow: false,
              canEdit: true,
              textEditingController: state.masterNameTextEditingController,
              dispatch: dispatch,
              viewService: viewService),
          ...buildItem("城市", "选择大致地址",
              hasArrow: true,
              textEditingController: state.cityTextEditingController,
              onTap: () {
            dispatch(AdoptionAddActionCreator.onSelectType("cityCode"));
          }, dispatch: dispatch, viewService: viewService),
        ],
      ),
    )
  ];
}

//安全部分
Card buildSafeWidget(
    AdoptionAddState state, Dispatch dispatch, ViewService viewService) {
  return Card(
    color: colorWhite,
    child: Column(
      children: <Widget>[
        ...buildItem("免疫", "是否免疫",
            hasArrow: true,
            textEditingController: state.isImmuneTextEditingController,
            onTap: () {
          dispatch(AdoptionAddActionCreator.onSelectType("isImmune"));
        }, dispatch: dispatch, viewService: viewService),
        ...buildItem("绝育", "是否绝育",
            hasArrow: true,
            textEditingController: state.isSterilizationTextEditingController,
            dispatch: dispatch, onTap: () {
          dispatch(AdoptionAddActionCreator.onSelectType("isSterilization"));
        }, viewService: viewService),
        ...buildItem("驱虫", "是否驱虫",
            hasArrow: true,
            textEditingController:
                state.isExpellingParasiteTextEditingController,
            dispatch: dispatch, onTap: () {
          dispatch(
              AdoptionAddActionCreator.onSelectType("isExpellingParasite"));
        }, viewService: viewService),
      ],
    ),
  );
}

//送养收费部分
Card buildMoneyWidget(
    AdoptionAddState state, Dispatch dispatch, ViewService viewService) {
  return Card(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<int>(
                    value: 0,
                    groupValue: state.adoptionType,
                    onChanged: (int value) {
                      dispatch(AdoptionAddActionCreator.onSetMoneyType(0));
                    },
                  ),
                  Text("无偿"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<int>(
                    value: 1,
                    groupValue: state.adoptionType,
                    onChanged: (int value) {
                      dispatch(AdoptionAddActionCreator.onSetMoneyType(1));
                    },
                  ),
                  Text("收押金"),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio<int>(
                    value: 2,
                    groupValue: state.adoptionType,
                    onChanged: (int value) {
                      dispatch(AdoptionAddActionCreator.onSetMoneyType(2));
                    },
                  ),
                  Text("有偿"),
                ],
              ),
            ),
          ],
        ),
        if (state.adoptionType == 1) ...[
          ...buildItem("押金金额(元)", "请输入押金金额",
              hasArrow: true,
              keyboardType: TextInputType.number,
              canEdit: true,
              viewService: viewService,
              textEditingController: state.cashPledgeTextEditingController,
              dispatch: dispatch, onTap: () {
            dispatch(AdoptionAddActionCreator.onSelectType("isSterilization"));
          }),
          ...buildItem("押金期限(天)", "请输入押金期限",
              hasArrow: true,
              keyboardType: TextInputType.number,
              canEdit: true,
              viewService: viewService,
              textEditingController:
                  state.cashPledgeDeadlineTextEditingController,
              dispatch: dispatch, onTap: () {
            dispatch(AdoptionAddActionCreator.onSelectType("isSterilization"));
          }),
        ],
        if (state.adoptionType == 2) ...[
          ...buildItem("有偿金额(元)", "本金额为最终金额",
              hasArrow: true,
              keyboardType: TextInputType.number,
              canEdit: true,
              viewService: viewService,
              textEditingController: state.moneyPledgeTextEditingController,
              dispatch: dispatch, onTap: () {
            dispatch(AdoptionAddActionCreator.onSelectType("isSterilization"));
          }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "虚假报价或最终交易金额高出报价金额,可能会被用户投诉导致账号永久被封",
              style: TextStyle(color: colorFF793C, fontSize: 12.0),
            ),
          )
        ]
      ],
    ),
  );
}

List<Widget> buildPicWidget(
    {AdoptionAddState state, Dispatch dispatch, ViewService viewService}) {
  List<Widget> gridItems = new List<Widget>();
  List<UploadTask> selectedPics = state.selectPicList ?? [];
  double itemWidth = WindowUtils.getScreenWidth() / 5.toDouble();
  if (selectedPics.isEmpty && state.localAdoption != null) {
    state.localAdoption.pic.forEach((itemUrl) {
      Widget item = new Padding(
        padding: const EdgeInsets.all(3.0),
        child: new ExtendedImage.network(
          itemUrl,
          fit: BoxFit.cover,
          width: itemWidth,
          height: itemWidth,
          enableLoadState: false,
        ),
      );
      gridItems.add(item);
    });
  } else {
    selectedPics.forEach((UploadTask selectedPic) {
      selectedPic.sequence = selectedPics.indexOf(selectedPic);
      Widget item = new Padding(
        padding: const EdgeInsets.all(3.0),
        child: new Image.file(
          new File(selectedPic.localUrl.toString()),
          fit: BoxFit.cover,
          width: itemWidth,
          height: itemWidth,
        ),
      );
      gridItems.add(item);
    });
  }

  gridItems.add(Container(
    width: itemWidth,
    height: itemWidth,
    padding: const EdgeInsets.all(3.0),
    child: new IconButton(
        icon: new Icon(
          Icons.add_a_photo,
          size: 30.0,
          color: const Color(0x40808080),
        ),
        onPressed: () {
          dispatch(AdoptionAddActionCreator.onReselectPic());
        }),
  ));
  return gridItems;
}

List<Widget> buildItem(String title, String helperText,
    {bool hasArrow = false,
    bool canEdit = false,
    GestureTapCallback onTap,
    TextEditingController textEditingController,
    TextInputType keyboardType: TextInputType.text,
    Dispatch dispatch,
    ViewService viewService}) {
  var of = Theme.of(viewService.context);
  return [
    InkWell(
      onTap: onTap ?? () {},
      child: SizedBox(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 10.0),
              child: Text(
                "$title:",
                style: of.textTheme.subhead,
              ),
            ),
            Expanded(
              child: TextField(
                keyboardType: keyboardType,
                enabled: canEdit,
                controller: textEditingController,
                decoration: InputDecoration(
                    hintText: helperText, border: InputBorder.none),
              ),
            ),
            if (hasArrow)
              Padding(
                padding: const EdgeInsets.only(right: 7.0),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
              )
          ],
        ),
      ),
    ),
    VerticalLine()
  ];
}
