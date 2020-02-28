import 'package:fish_redux/fish_redux.dart';

enum CommitTextAction { UploadCommit }

class CommitTextActionCreator {
  static Action onUploadCommit() {
    return const Action(CommitTextAction.UploadCommit);
  }
}
