import 'package:fish_redux/fish_redux.dart';

enum RecordAction {
  RefreshPage,
  CameraSwitched,
  TakePicture,
  RecordStart,
  RecordEnd
}

class RecordActionCreator {
  static Action onRefreshPage() {
    return const Action(RecordAction.RefreshPage);
  }

  static Action onCameraSwitched() {
    return const Action(RecordAction.CameraSwitched);
  }

  static Action onTakePicture() {
    return const Action(RecordAction.TakePicture);
  }

  static Action onRecordStart() {
    return const Action(RecordAction.RecordStart);
  }

  static Action onRecordEnd() {
    return const Action(RecordAction.RecordEnd);
  }
}
