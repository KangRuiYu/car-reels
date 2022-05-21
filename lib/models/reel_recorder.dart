import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class ReelRecorder extends ChangeNotifier {
  late CameraController controller;
  bool get recording => _recording;
  bool _recording = false;

  final CameraDescription _camera;
  int _timeCount = 1;
  int _imageCount = 1;

  Directory _dataDir = Directory('');

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
    Directory? storageDir = await getExternalStorageDirectory();

    Uuid uuid = const Uuid();
    String dirName = uuid.v1();
    Directory dir = Directory('${storageDir?.path}/$dirName');
    Directory imageDir = Directory('${dir.path}/images');
    await imageDir.create(recursive: true);

    File infoFile = File('${dir.path}/info.txt');
    await infoFile.writeAsString('Tesla\nModel S\n10000');

    await controller.unlockCaptureOrientation();
    await controller.startImageStream(
      (CameraImage image) async {
        if (++_timeCount % 5 == 0) {
          File imageFile = File(
            '${imageDir.path}/image$_imageCount.jpeg',
          );
          await imageFile.writeAsBytes(image.planes[0].bytes);
          _imageCount++;
        }
      },
    );

    _recording = true;
    _dataDir = dir;
    notifyListeners();
  }

  Future<Directory> stopRecording() async {
    await controller.stopImageStream();
    _recording = false;
    notifyListeners();
    return _dataDir;
  }
}
