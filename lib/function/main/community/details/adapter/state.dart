import 'package:chongmeng/function/main/community/details/model/comment_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class ReplyListState implements Cloneable<ReplyListState> {
  List<CommentData> data;

  @override
  ReplyListState clone() {
    return ReplyListState()..data = data;
  }
}

ReplyListState initState(Map<String, dynamic> args) {
  return ReplyListState();
}
