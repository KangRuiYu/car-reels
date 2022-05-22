import 'dart:io';

import 'package:camera/camera.dart';
import 'package:car_reels/models/camera_infos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_reels/models/reel_recorder.dart';
import 'package:provider/provider.dart';

class RecordingScreen extends StatelessWidget {
  final String id;

  const RecordingScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReelRecorder(
        context.read<CameraInfos>().primaryCamera(),
      ),
      child: Builder(builder: (context) {
        if (context.select((ReelRecorder r) => r.initialized())) {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: CameraPreview(
                      context.watch<ReelRecorder>().controller,
                    ),
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.cancel_outlined),
                          iconSize: 30.0,
                          color: Colors.white,
                          splashColor: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Spacer(),
                      ControlPanel(id),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center();
        }
      }),
    );
  }
}

class ControlPanel extends StatelessWidget {
  final String id;

  const ControlPanel(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(20),
        ),
      ),
      width: double.infinity,
      height: 140.0,
      child: Center(
        child: RecordButton(id),
      ),
    );
  }
}

class RecordButton extends StatelessWidget {
  final String id;

  const RecordButton(this.id);

  @override
  Widget build(BuildContext context) {
    if (context.watch<ReelRecorder>().recording) {
      return ElevatedButton(
        child: const Icon(Icons.stop_outlined, size: 40),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15),
        ),
        onPressed: () async {
          Navigator.pop(context);
        },
      );
    } else {
      return ElevatedButton(
        child: const Icon(Icons.fiber_manual_record_outlined, size: 40),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15),
        ),
        onPressed: () {
          context.read<ReelRecorder>().startRecording(id);
        },
      );
    }
  }
}
