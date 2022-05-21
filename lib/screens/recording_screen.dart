import 'package:camera/camera.dart';
import 'package:car_reels/models/camera_infos.dart';
import 'package:flutter/material.dart';
import 'package:car_reels/models/reel_recorder.dart';
import 'package:provider/provider.dart';

class RecordingScreen extends StatelessWidget {
  const RecordingScreen();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReelRecorder(
        context.read<CameraInfos>().primaryCamera(),
      ),
      child: Column(
        children: [
          const ReelPreview(),
          ElevatedButton(
            child: const Text('Record'),
            onPressed: () {},
          ),
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class ReelPreview extends StatelessWidget {
  const ReelPreview();

  @override
  Widget build(BuildContext context) {
    if (context.watch<ReelRecorder>().initialized()) {
      return CameraPreview(context.watch<ReelRecorder>().controller);
    } else {
      return const Expanded(child: Center());
    }
  }
}
