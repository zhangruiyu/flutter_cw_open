import 'dart:io';

import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/loadling_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:oktoast/oktoast.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    DynamicDetailsState state, Dispatch dispatch, ViewService viewService) {
  var data = state.data;
  Widget content;
  var buildAdapter = viewService.buildAdapter();
  int crossAxisCount;
  if (data.images != null && data.images.length > 0) {
    if (data.images.length <= 3) {
      crossAxisCount = 1;
    } else if (data.images.length == 4) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }
    if (data.images.length == 1) {
      content = SliverToBoxAdapter(
        child: buildItemPic(data.images[0], dispatch, 0),
      );
    } else {
      content = SliverGrid.count(
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        crossAxisCount: crossAxisCount,
        children: data.images
            .map((item) =>
                buildItemPic(item, dispatch, data.images.indexOf(item)))
            .toList(),
      );
    }
  } else if (data.video != null) {
    content =
        SliverToBoxAdapter(child: buildVideoView(state, dispatch, viewService));
  } else {
    content = SliverToBoxAdapter(
      child: Text(data.content),
    );
  }
  return Scaffold(
    backgroundColor: colorWhite,
    floatingActionButton: Padding(
      padding: const EdgeInsets.only(bottom: 58.0),
      child: FloatingActionButton(
        child: Icon(Icons.reply),
        onPressed: () {
          dispatch(DynamicDetailsActionCreator.onSetReplyInfo(null));
          dispatch(DynamicDetailsActionCreator.onRequestFocus());
        },
      ),
    ),
    appBar: Toolbar(
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              showToast("已举报");
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "举报",
                style: TextStyle(color: colorWhite),
              ),
            ),
          ),
        )
      ],
    ),
    body: Column(
      children: <Widget>[
        Expanded(
          child: EasyRefresh.custom(
            key: PageStorageKey<String>("community_details"),
            firstRefresh: true,
            controller: state.easyRefreshController,
            firstRefreshWidget: LoadingWidget(),
            onRefresh: CompleterUtils.produceCompleterAction(
              dispatch,
              DynamicDetailsActionCreator.onRefresh,
            ),
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                sliver: SliverToBoxAdapter(
                  child: viewService.buildComponent('community_user_head'),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, top: 10.0, bottom: 15.0),
                sliver: SliverToBoxAdapter(
                  child: Text(data.content),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                    bottom: 10.0, left: 18.0, right: 18.0),
                sliver: content,
              ),
              SliverToBoxAdapter(
                child: VerticalLine(
                  height: 5.0,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 10.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(buildAdapter.itemBuilder,
                      childCount: buildAdapter.itemCount),
                ),
              )
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                margin: EdgeInsets.only(
                    left: 15.0, top: 10.0, bottom: 10.0, right: 15.0),
                child: TextField(
                  scrollPadding: const EdgeInsets.all(5.0),
                  controller: state.commentEditingController,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (str) {
                    dispatch(DynamicDetailsActionCreator.onCommit());
                  },
                  focusNode: state.commentNode,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: state.replyInfo == null
                          ? "添加一条评论"
                          : "回复 ${state.replyInfo.userName}:",
                      hintStyle: TextStyle(color: colorD1D0D0, fontSize: 12.0)),
//                  autofocus: true,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14.0),
                ),
                decoration: BoxDecoration(
                    color: Color(0xfff7f7f7),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
              ),
            ),
            state.selectPic == null
                ? IconButton(
                    icon: Icon(
                      MdiIcons.cameraMeteringPartial,
                    ),
                    onPressed: () {
                      dispatch(DynamicDetailsActionCreator.onSelectPic());
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      dispatch(DynamicDetailsActionCreator.onSetPic(null));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 8.0, right: 8.0),
                      width: 30.0,
                      height: 30.0,
                      child: Image.file(
                        File(state.selectPic),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            InkWell(
              onTap: () {
                dispatch(DynamicDetailsActionCreator.onCommit());
              },
              child: Container(
                height: 50.0,
                margin: const EdgeInsets.only(right: 22.0, left: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text("发送"),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget buildVideoView(
    DynamicDetailsState state, Dispatch dispatch, ViewService viewService) {
  var data = state.data;
  var video = data.video;
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Hero(
          transitionOnUserGestures: true,
          tag: video.videoThumbnailPath,
          child: new ExtendedImage.network(
            video.videoThumbnailPath,
            fit: BoxFit.cover,
            height: WindowUtils.getScreenWidth() * 0.45,
            width: double.infinity,
            enableLoadState: false,
          ),
        ),
        IconButton(
          onPressed: () {
            dispatch(DynamicDetailsActionCreator.onSkipReviewPage(0));
          },
          icon: Icon(Icons.play_circle_outline),
          color: Theme.of(viewService.context).accentColor,
          iconSize: 50.0,
        )
      ],
    ),
  );
}

Widget buildItemPic(itemImage, Dispatch dispatch, index) {
  return GestureDetector(
    onTap: () {
      dispatch(DynamicDetailsActionCreator.onSkipReviewPage(index));
    },
    child: new ExtendedImage.network(
      itemImage,
      fit: BoxFit.cover,
      width: double.infinity,
      enableLoadState: false,
    ),
  );
}
