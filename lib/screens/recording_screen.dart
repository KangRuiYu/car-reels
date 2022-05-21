import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_reels/models/camera_infos.dart';
import 'package:car_reels/models/reel_recorder.dart';

class RecordingScreen extends StatelessWidget {
  const RecordingScreen();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReelRecorder(context.read<CameraInfos>().primaryCamera()),
        ElevatedButton(
          child: const Text('Record'),
          onPressed: () {},
        ),
        ElevatedButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
