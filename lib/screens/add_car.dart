import 'dart:io';

import 'package:car_reels/screens/recording_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/camera_infos.dart';
import '../models/listing.dart';
import '../models/listing_loader.dart';
import '../widgets/reel.dart';

class CarForm extends StatefulWidget {
  const CarForm({Key? key}) : super(key: key);

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  // This widget is the root of your application.
  final Map<String, TextEditingController> _controllers = {
    'name': TextEditingController(),
    'year': TextEditingController(),
    'price': TextEditingController(),
    'mileage': TextEditingController(),
    'emission_type': TextEditingController(),
    'condition': TextEditingController(),
    'mpg': TextEditingController(),
    'engine': TextEditingController(),
    'horse_power': TextEditingController(),
  };
  final String id = const Uuid().v1();
  bool recorded = false;

  Future<Directory> getDir() async {
    Directory? storageDir = await getExternalStorageDirectory();
    String dirName = id;
    Directory dir = Directory('${storageDir?.path}/$dirName');
    return dir;
  }

  Future<void> saveListing() async {
    Directory? storageDir = await getExternalStorageDirectory();

    String dirName = id;
    Directory dir = Directory('${storageDir?.path}/$dirName');
    Directory imageDir = Directory('${dir.path}/images');
    await imageDir.create(recursive: true);

    File infoFile = File('${dir.path}/info.txt');
    String str = "";

    str += (_controllers['name']?.text ?? "") + '\n';
    str += (_controllers['year']?.text ?? "") + '\n';
    str += (_controllers['price']?.text ?? "") + '\n';
    str += (_controllers['mileage']?.text ?? "") + '\n';
    str += (_controllers['emission_type']?.text ?? "") + '\n';
    str += (_controllers['condition']?.text ?? "") + '\n';
    str += (_controllers['mpg']?.text ?? "") + '\n';
    str += (_controllers['engine']?.text ?? "") + '\n';
    str += (_controllers['horse_power']?.text ?? "");

    await infoFile.writeAsString(str);

    Reference _storageRef = FirebaseStorage.instance.ref().child('$dirName');
    Reference _infoRef = _storageRef.child('info.txt');
    _infoRef.putFile(infoFile);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Add Car Listing'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await saveListing();
              Directory? storageDir = await getExternalStorageDirectory();
              String dirName = id;
              Directory dir = Directory('${storageDir?.path}/$dirName');
              context.read<ListingLoader>().addListing(dir);
              Navigator.pop(context);
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add)),
        body: ListView(
          children: <Widget>[
            Container(
              height: 275,
              decoration: recorded
                  ? const BoxDecoration()
                  : const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://image.made-in-china.com/2f0j00jsTRSMVnLrce/EV-Car.jpg"),
                          fit: BoxFit.cover),
                    ),
              child: Stack(
                children: [
                  recorded
                      ? FutureBuilder(
                          future: getDir(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Reel(Listing(snapshot.data as Directory));
                            } else {
                              return Container();
                            }
                          },
                        )
                      : Container(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          // Col 1
                          Expanded(
                            flex: 3,
                            child: Column(children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MultiProvider(
                                            providers: [
                                              Provider.value(
                                                value:
                                                    context.read<CameraInfos>(),
                                              ),
                                              ChangeNotifierProvider.value(
                                                value: context
                                                    .read<ListingLoader>(),
                                              ),
                                            ],
                                            child: RecordingScreen(id),
                                          );
                                        },
                                      ),
                                    ).then(
                                        (_) => setState(() => recorded = true));
                                  },
                                  child: const Icon(Icons.camera_alt_outlined)),
                            ]),
                          ),
                          // Col 2
                          Expanded(
                            flex: 10,
                            child: Column(children: [
                              SizedBox(
                                width: 180,
                                child: TextField(
                                  controller: _controllers['name'],
                                  decoration: InputDecoration(
                                    hintText: 'Ex: Tesla Roadster',
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          // Col 3
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Icon(Icons.fullscreen)),
                                ],
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          SizedBox(
                            height: 150.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            recorded
                ? const SizedBox()
                : const SizedBox(
                    height: 20,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Col 1
                Expanded(
                  flex: 2,
                  child: Column(children: const [
                    Text(
                      'Year',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ]),
                ),
                // Col 2
                Expanded(
                  flex: 4,
                  child: Column(children: const [
                    Text(
                      'Price',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ]),
                ),
                // Col 3
                Expanded(
                    flex: 2,
                    child: Column(
                      children: const [
                        Text(
                          'Mileage',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Col 1
                Expanded(
                  flex: 2,
                  child: Column(children: [
                    SizedBox(
                      width: 80,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _controllers['year'],
                        decoration: InputDecoration(
                          hintText: 'Ex: 2018',
                        ),
                      ),
                    ),
                  ]),
                ),
                // Col 2
                Expanded(
                  flex: 4,
                  child: Column(children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _controllers['price'],
                        decoration: InputDecoration(
                          hintText: 'Ex: \$58,000',
                        ),
                      ),
                    ),
                  ]),
                ),
                // Col 3
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80,
                          child: TextField(
                            controller: _controllers['mileage'],
                            decoration: InputDecoration(
                              hintText: 'Ex: 120k',
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            const Divider(
              color: Colors.black,
              height: 35,
              thickness: .25,
              indent: 10,
              endIndent: 10,
            ),
            // Information Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Col 1
                Expanded(
                  flex: 6,
                  child: Column(children: const [
                    Text(
                      'Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
                // Col 2
                Expanded(
                  flex: 6,
                  child: Column(children: const [
                    Text(
                      'Features',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            // Info Drop Downs
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  // Detail Elements
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Col 1
                        Expanded(
                          flex: 4,
                          child: Column(children: const [
                            Text(
                              'Emission Type',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ]),
                        ),

                        // Col 2
                        Expanded(
                          flex: 5,
                          child: Column(children: [
                            SizedBox(
                              width: 140,
                              child: TextField(
                                controller: _controllers['emission_type'],
                                decoration: InputDecoration(
                                  hintText: 'Ex: Hybrid',
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Col 1
                        Expanded(
                          flex: 4,
                          child: Column(children: const [
                            Text(
                              'Condition',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ]),
                        ),

                        // Col 2
                        Expanded(
                          flex: 5,
                          child: Column(children: [
                            SizedBox(
                              width: 140,
                              child: TextField(
                                controller: _controllers['condition'],
                                decoration: InputDecoration(
                                  hintText: 'Ex: Factory New',
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Col 1
                        Expanded(
                          flex: 4,
                          child: Column(children: const [
                            Text(
                              'MPG',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ]),
                        ),

                        // Col 2
                        Expanded(
                          flex: 5,
                          child: Column(children: [
                            SizedBox(
                              width: 140,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _controllers['mpg'],
                                decoration: InputDecoration(
                                  hintText: 'Ex: 28',
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Col 1
                        Expanded(
                          flex: 4,
                          child: Column(children: const [
                            Text(
                              'Engine',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ]),
                        ),

                        // Col 2
                        Expanded(
                          flex: 5,
                          child: Column(children: [
                            SizedBox(
                              width: 140,
                              child: TextField(
                                controller: _controllers['engine'],
                                decoration: InputDecoration(
                                  hintText: 'Ex: 1000V Battery',
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Col 1
                        Expanded(
                          flex: 4,
                          child: Column(children: const [
                            Text(
                              'Horsepower',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ]),
                        ),

                        // Col 2
                        Expanded(
                          flex: 5,
                          child: Column(children: [
                            SizedBox(
                              width: 140,
                              child: TextField(
                                controller: _controllers['horse_power'],
                                decoration: InputDecoration(
                                  hintText: 'Ex: 158-252',
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
