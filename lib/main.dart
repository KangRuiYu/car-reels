import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_reels/models/camera_infos.dart';
import 'package:car_reels/screens/main_screen.dart';

import 'models/listing_loader.dart';

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
    return MultiProvider(
      providers: [
        Provider.value(value: _cameraInfos),
        ChangeNotifierProvider(
          create: (context) {
            ListingLoader l = ListingLoader();
            l.loadListings();
            return l;
          },
        ),
      ],
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
