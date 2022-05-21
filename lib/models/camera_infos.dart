import 'package:camera/camera.dart';

class CameraInfos {
  late List<CameraDescription> _cameras;

  // Gets available cameras from device
  Future<void> getCameras() async {
    _cameras = await availableCameras();
  }

  // Returns the primary camera
  CameraDescription primaryCamera() {
    return _cameras[0];
  }
}
