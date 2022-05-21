import 'package:car_reels/models/camera_infos.dart';
import 'package:flutter/material.dart';
import 'package:car_reels/screens/recording_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Car Reels')),
      body: Center(
        child: ElevatedButton(
          child: const Text('New video'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Provider.value(
                    value: context.read<CameraInfos>(),
                    child: const RecordingScreen(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
