import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../action.dart';
import '../state.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(ReplyState state, Dispatch dispatch, ViewService viewService) {
  var data = state.data;
  return InkWell(
    onTap: () {
      dispatch(DynamicDetailsActionCreator.onSetReplyInfo(
          ReplyInfo(replyId: data.id, userName: data.nickName)));
      dispatch(DynamicDetailsActionCreator.onRequestFocus());
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: ExtendedImage.network(
                  data.avatar,
                  fit: BoxFit.cover,
                  enableLoadState: false,
                  width: 35.0,
                  height: 35.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(data.nickName),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0, top: 12.0),
            child: Text(data.content),
          ),
          if (data.pic?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(left: 48.0, top: 5.0),
              child: GestureDetector(
                onTap: () {
                  dispatch(ReplyActionCreator.onSkipReviewImagePage(data.pic));
                },
                child: ExtendedImage.network(
                  data.pic,
                  fit: BoxFit.cover,
                  enableLoadState: false,
                  height: 80.0,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 48.0, top: 8.0),
            child: Row(
              children: <Widget>[
                Text(
                  RelativeDateUtils.getTimestampString(
                      DateUtils.string2dateTime(data.createTime)),
                  style: TextStyle(fontSize: 12.0, color: color7E7E7E),
                ),
                if (data.reply?.isNotEmpty == true)
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      color: Colors.grey[200],
                    ),
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                    child: Text(
                      "${data.reply.length}条回复",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  )
              ],
            ),
          ),
          //子评论
          if (data.reply?.isNotEmpty == true)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(3.0),
                ),
                color: Colors.grey[200],
              ),
              width: double.infinity,
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              margin: const EdgeInsets.only(left: 48.0, right: 5.0, top: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: data.reply.map((itemReply) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 3.0, top: 3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print("tapped");
                                      },
                                    text: "${itemReply.nickName}",
                                    style: TextStyle(color: Colors.blue[300])),
                                //如果回复的id是当前大回复id,那么就不展示回复
                                if (itemReply.replyId != data.id ||
                                    itemReply.userId != data.userId) ...[
                                  TextSpan(
                                      text: "回复",
                                      style: TextStyle(color: color343434)),
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("tapped");
                                        },
                                      text:
                                          "${data.id == itemReply.replyId ? data.nickName : data.reply.firstWhere((item) => item.id == itemReply.replyId).toString()}",
                                      style:
                                          TextStyle(color: Colors.blue[300])),
                                ],
                                TextSpan(
                                    text: ": ",
                                    style: TextStyle(color: Colors.blue[300])),
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        dispatch(DynamicDetailsActionCreator
                                            .onSetReplyInfo(ReplyInfo(
                                                replyId: itemReply.id,
                                                userName: itemReply.nickName)));
                                        dispatch(DynamicDetailsActionCreator
                                            .onRequestFocus());
                                      },
                                    text: itemReply.content,
                                    style: TextStyle(color: color343434)),
                              ],
                              style: TextStyle(
                                fontSize: 12.0,
                              )),
                        ),
                        if (itemReply.pic?.isNotEmpty == true)
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: GestureDetector(
                              onTap: () {
                                dispatch(
                                    ReplyActionCreator.onSkipReviewImagePage(
                                        itemReply.pic));
                              },
                              child: ExtendedImage.network(
                                itemReply.pic,
                                fit: BoxFit.cover,
                                enableLoadState: false,
                                height: 80.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
        ],
      ),
    ),
  );
}
