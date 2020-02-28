import 'package:fish_redux/fish_redux.dart';
import 'package:camera/camera.dart';

class RecordState implements Cloneable<RecordState> {
  List<CameraDescription> cameras;

  CameraController controller;

  String videoPath;

  @override
  RecordState clone() {
    return RecordState()
      ..cameras = cameras
      ..controller = controller
      ..videoPath = videoPath;
  }
}

RecordState initState(Map<String, dynamic> args) {
  return RecordState()..cameras = args['cameras'];
}
