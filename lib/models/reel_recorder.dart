import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

class ReelRecorder extends ChangeNotifier {
  late CameraController controller;
  bool get recording => _recording;
  bool _recording = false;

  final CameraDescription _camera;
  int _timeCount = 1;
  int _imageCount = 1;

  ReelRecorder(this._camera) {
    _init();
  }

  void _init() async {
    controller = CameraController(
      _camera,
      ResolutionPreset.max,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

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

  void startRecording() async {
    Directory? dir = await getExternalStorageDirectory();
    if (dir == null) return;

    await controller.startImageStream(
      (CameraImage image) async {
        if (++_timeCount % 10 == 0) {
          File file = File('${dir.path}/image$_imageCount.jpeg');
          await file.writeAsBytes(image.planes[0].bytes);
          _imageCount++;
          print('Saving ${file.path}');
        }
      },
    );

    _recording = true;
    notifyListeners();
  }

  void stopRecording() async {
    await controller.stopImageStream();
    _recording = false;
    notifyListeners();
  }
}
