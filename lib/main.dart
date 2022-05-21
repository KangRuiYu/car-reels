import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_reels/models/camera_infos.dart';
import 'package:car_reels/screens/main_screen.dart';

Future<void> main() async {
  // Get cameras
  WidgetsFlutterBinding.ensureInitialized();

  CameraInfos cameraInfos = CameraInfos();
  await cameraInfos.getCameras();

  runApp(MyApp(cameraInfos));
}

class MyApp extends StatelessWidget {
  CameraInfos _cameraInfos;

  MyApp(this._cameraInfos);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _cameraInfos,
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
