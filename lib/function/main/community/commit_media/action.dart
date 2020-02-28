import 'package:fish_redux/fish_redux.dart';

enum CommitMediaAction {
  ChangeSelectPic,
  UploadCommitPic,
  UploadCommitVideo,
  ReselectPic,
  SkipReviewPage
}

class CommitMediaActionCreator {
  static Action onChangeSelectPic(data) {
    return Action(CommitMediaAction.ChangeSelectPic, payload: data);
  }

  static Action onUploadCommitPic() {
    return const Action(CommitMediaAction.UploadCommitPic);
  }

  static Action onUploadCommitVideo() {
    return const Action(CommitMediaAction.UploadCommitVideo);
  }

  static Action onReselectPic() {
    return const Action(CommitMediaAction.ReselectPic);
  }

  static Action onSkipReviewPage() {
    return const Action(CommitMediaAction.SkipReviewPage);
  }
}
