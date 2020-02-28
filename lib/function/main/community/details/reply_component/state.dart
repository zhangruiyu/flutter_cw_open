import 'package:chongmeng/function/main/community/details/model/comment_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class ReplyState implements Cloneable<ReplyState> {
  CommentData data;

  ReplyState({this.data});

  @override
  ReplyState clone() {
    return ReplyState()..data = data;
  }
}

ReplyState initState(Map<String, dynamic> args) {
  return ReplyState();
}
