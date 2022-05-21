import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ReelRecorder extends ChangeNotifier {
  late CameraController controller;
  final CameraDescription _camera;

  ReelRecorder(this._camera) {
    _init();
  }

  void _init() async {
    controller = CameraController(_camera, ResolutionPreset.max);

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          print('User denied camera access.');
          break;
        default:
          print('Handle other errors.');
          break;
      }
    }

    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool initialized() {
    return controller.value.isInitialized;
  }

  void startRecording() {
    controller.startImageStream(
      (CameraImage image) {
        print(image.format);
      },
    );
  }

  void stopRecording() {
    controller.stopImageStream();
  }
}
