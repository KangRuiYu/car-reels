import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class ReelRecorder extends StatefulWidget {
  final CameraDescription _camera;

  const ReelRecorder(this._camera);

  @override
  State<ReelRecorder> createState() => _ReelRecorderState();
}

class _ReelRecorderState extends State<ReelRecorder> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(widget._camera, ResolutionPreset.max);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return CameraPreview(_controller);
  }
}
