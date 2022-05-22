import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:car_reels/models/camera_infos.dart';
import 'package:car_reels/screens/main_screen.dart';
<<<<<<< HEAD
import 'package:car_reels/screens/car.dart';
import 'package:car_reels/screens/add_car.dart';
=======
>>>>>>> b77aac6fdf19905964cc94d3570ad9a5198591fa

import 'models/listing_loader.dart';

Future<void> main() async {
  // Get cameras
  WidgetsFlutterBinding.ensureInitialized();

  CameraInfos cameraInfos = CameraInfos();
  await cameraInfos.getCameras();

<<<<<<< HEAD
  //runApp(MyApp(cameraInfos));
  runApp(const CarForm());
=======
  runApp(MyApp(cameraInfos));
>>>>>>> b77aac6fdf19905964cc94d3570ad9a5198591fa
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
