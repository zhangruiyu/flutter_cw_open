import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/main/account/action.dart';
import 'package:chongmeng/function/main/store/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart';

import 'action.dart';
import 'home/action.dart';
import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  if (state.views == null) {
    state.views = [
      viewService.buildComponent('home'),
      Container(),
      Container(),
      Container(),
      Container()
    ];
  }
  if (state.mainPageIndex == 1 && state.views[1] is Container) {
    state.views.replaceRange(1, 2, [viewService.buildComponent('community')]);
  }
  if (state.mainPageIndex == 2 && state.views[2] is Container) {
    state.views.replaceRange(2, 3, [viewService.buildComponent('adoption')]);
  }
  if (state.mainPageIndex == 3 && state.views[3] is Container) {
    state.views.replaceRange(3, 4, [viewService.buildComponent('store')]);
  }
  if (state.mainPageIndex == 4 && state.views[4] is Container) {
    state.views.replaceRange(4, 5, [viewService.buildComponent('account')]);
  }
  return Scaffold(
    body: IndexedStack(
      children: state.views,
      index: state.mainPageIndex,
    ),
    floatingActionButton: FloatingActionButton(
      elevation: 0.0,
      onPressed: () {
        dispatch(MainActionCreator.onChangeNewPage(2));
//        NavigatorHelper.pushConversationPage(viewService.context);
      },
      child: Image.asset(
        "assets/home_page_adopt.png",
        width: 30.0,
      ),
      backgroundColor: Theme.of(viewService.context).accentColor,
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: CMBottomAppBar(
        currentIndex: state.mainPageIndex,
        color: Colors.white,
        fabLocation: FloatingActionButtonLocation.centerFloat,
        shape: CircularNotchedRectangle(),
        onTap: (int index) {
          println("index" + index.toString());
          dispatch(MainActionCreator.onChangeNewPage(
              index > 1 ? (index + 1) : index));
          if (index == 0) {
            dispatch(HomeActionCreator.onRefresh(null));
          } else if (index == 2) {
            dispatch(StoreActionCreator.onRefresh(null));
          } else if (index == 3) {
            dispatch(AccountActionCreator.onRefresh(null));
          }
        },
        items: <BottomNavigationBarItemData>[
          BottomNavigationBarItemData(
            selectIcon: "assets/main_home_select.png",
            normalIcon: "assets/main_home_normal.png",
            title: '首页',
          ),
          BottomNavigationBarItemData(
            selectIcon: "assets/main_community_select.png",
            normalIcon: "assets/main_community_normal.png",
            title: '社区',
          ),
          BottomNavigationBarItemData(
            selectIcon: "assets/main_store_select.png",
            normalIcon: "assets/main_store_normal.png",
            title: '商城',
          ),
          BottomNavigationBarItemData(
            selectIcon: "assets/main_my_select.png",
            normalIcon: "assets/main_my_normal.png",
            title: DefaultLocalizations.of(viewService.context).me,
          ),
        ]),
  );
}

class CMBottomAppBar extends StatefulWidget {
  const CMBottomAppBar({
    this.color,
    this.fabLocation,
    this.shape,
    this.items,
    this.currentIndex: 0,
    this.onTap,
  });

  final ValueChanged<int> onTap;
  final Color color;
  final int currentIndex;
  final FloatingActionButtonLocation fabLocation;
  final NotchedShape shape;
  final List<BottomNavigationBarItemData> items;

  @override
  _CMBottomAppBarState createState() => _CMBottomAppBarState();
}

class _CMBottomAppBarState extends State<CMBottomAppBar> {
  static final List<FloatingActionButtonLocation> kCenterLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  addItem(List<Widget> rowContents, int index, BuildContext context) {
    var item = widget.items[index];
    bool isSelect;
    if (widget.currentIndex == 2) {
      isSelect = false;
    } else {
      isSelect = (widget.currentIndex > 1
              ? (widget.currentIndex - 1)
              : widget.currentIndex) ==
          index;
    }

    rowContents.add(
      Expanded(
        child: new InkResponse(
          onTap: () {
            widget.onTap(index);
          },
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IndexedStack(
                index: isSelect ? 1 : 0,
                children: <Widget>[
                  Image.asset(
                    item.normalIcon,
                  ),
                  Image.asset(
                    item.selectIcon,
                  ),
                ],
              ),
              new Text(
                item.title,
                style: TextStyle(
                    color:
                        isSelect ? Theme.of(context).accentColor : color333333,
                    fontSize: 10.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowContents = <Widget>[];
    addItem(rowContents, 0, context);
    addItem(rowContents, 1, context);
    if (kCenterLocations.contains(widget.fabLocation)) {
      rowContents.add(
        const Expanded(child: SizedBox()),
      );
    }
    addItem(rowContents, 2, context);
    addItem(rowContents, 3, context);

    return BottomAppBar(
      color: widget.color,
      child: SizedBox(
        height: 49.0,
        child: Row(children: rowContents),
      ),
      shape: widget.shape,
    );
  }
}

class BottomNavigationBarItemData {
  final String normalIcon;
  final String selectIcon;
  final String title;

  BottomNavigationBarItemData({this.normalIcon, this.selectIcon, this.title});
}
