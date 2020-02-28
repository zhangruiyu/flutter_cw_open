import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/store/integral_commodity_detail/effect.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/custom_dialog.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'action.dart';
import 'model/recipe_entity.dart';
import 'state.dart';

class IconInfo {
  MaterialColor color;
  IconData icon;

  IconInfo(this.color, this.icon);
}

Map<int, IconInfo> icons = {
  1: IconInfo(Colors.red, MdiIcons.closeCircle),
  2: IconInfo(Colors.red, MdiIcons.closeCircle),
  3: IconInfo(Colors.yellow, MdiIcons.alertCircle),
  4: IconInfo(Colors.green, MdiIcons.checkboxMarkedCircle),
  5: IconInfo(Colors.green, MdiIcons.checkboxMultipleMarkedCircle),
};

Widget buildView(
    RecipeState state, Dispatch dispatch, ViewService viewService) {
//  var indicatorWidth = (WindowUtils.getScreenWidth() / 3 - 14) / 2;
  var indicatorWidth = 15.0;
  var of = Theme.of(viewService.context);
  var accentColor = of.accentColor;
  return Scaffold(
    appBar: Toolbar(
        title: Text("宠物食谱"),
        bottom: state.data.length == 0
            ? null
            : TabBar(
                isScrollable: true,
                labelColor: colorWhite,
                indicatorColor: accentColor,
                unselectedLabelColor: colord9d9d9,
                labelStyle: new TextStyle(fontSize: 18.0),
                unselectedLabelStyle: new TextStyle(fontSize: 15.0),
                indicatorPadding: new EdgeInsets.only(
                    left: indicatorWidth, right: indicatorWidth, bottom: 5.0),
                tabs: state.data
                    .map(
                      (RecipeData page) => new Tab(text: page.title),
                    )
                    .toList(),
                controller: state.tabController,
              )),
    body: EasyRefresh.custom(
      firstRefresh: true,
      firstRefreshWidget: LoadingWidget(),
      onRefresh: CompleterUtils.produceCompleterAction(
        dispatch,
        RecipeActionCreator.onRefresh,
      ),
      slivers: <Widget>[
        SliverFillRemaining(
          child: TabBarView(
              controller: state.tabController,
              children: state.data.map((itemData) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 10.0),
                  itemBuilder: (BuildContext context, int index) {
                    var data = itemData.data[index];
                    return Card(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: InkWell(
                        onTap: () {
                          showDescDialog(viewService, data, of);
                        },
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ExtendedImage.network(
                                    data.pic,
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                    enableLoadState: false,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        data.name,
                                        style: of.textTheme.title,
                                      ),
                                      Text(
                                        data.description,
                                        maxLines: 3,
                                        style: of.textTheme.caption,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        icons[data.smallStar].icon,
                                        color: icons[data.smallStar].color,
                                      ),
                                      Text("幼犬")
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        icons[data.middleStar].icon,
                                        color: icons[data.middleStar].color,
                                      ),
                                      Text("成犬")
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        icons[data.bigStar].icon,
                                        color: icons[data.bigStar].color,
                                      ),
                                      Text("老年犬")
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: itemData.data?.length ?? 0,
                  separatorBuilder: (BuildContext context, int index) {
                    return VerticalLine(
                      height: 10.0,
                      dividerColor: Colors.transparent,
                    );
                  },
                );
              }).toList()),
        )
      ],
    ),
  );
}

void showDescDialog(
    ViewService viewService, RecipeDataData data, ThemeData of) {
  showDialog(
      context: viewService.context,
      builder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          child: CanSetWidthDialog(
              minWidth: 275.0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        color: colorWhite),
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 22.0, top: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.name,
                          style: of.textTheme.title,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data.description),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0, bottom: 30.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(viewService.context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: colorWhite,
                      ),
                    ),
                  )
                ],
              )),
        );
      });
}
