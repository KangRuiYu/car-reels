import 'package:car_reels/models/camera_infos.dart';
import 'package:flutter/material.dart';
import 'package:car_reels/screens/recording_screen.dart';
import 'package:provider/provider.dart';

import '../models/listing_loader.dart';
import '../widgets/reel.dart';
import 'car.dart';

void main() => runApp(const MainScreen());

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  List dataList =
      new List<int>.generate(10, (index) => index); //length of list, index
  String city = "City";//["Irvine", "San Francisco", "New York", "Chicago", "Seattle", "Aldwin Park"];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(title: const Text('Car Reels')),
      body:
        Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButton(
                  value: city,
                  items: <String>["City","Irvine", "San Francisco", "New York", "Chicago", "Seattle", "Aldwin Park"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }
                  ).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      city = newValue!;
                    });
                  },),
              )
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text("CarReels",
                  textAlign: TextAlign.left,
                  textScaleFactor: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 25,
                height: 44,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: TextField(

                      decoration: InputDecoration(
                        isDense: false,
                        contentPadding: EdgeInsets.only(left: 5),
                        filled: true,
                        fillColor: Colors.white,
                          prefixIcon: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.search),
                            color: Colors.blue,
                            iconSize: 25,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(180)
                        ),
                        hintText: 'Enter a search term',
                        hintStyle: TextStyle(
                           fontSize: 25
                          )
                        ),
                      ),

                  ),
                ),
              ),
            ),


            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: dataList.map((value) {
                  return Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.2,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 4,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Text("Item ${value}"),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
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
        child: const Text(
          "+",
          textScaleFactor: 2,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
=======
    ListingLoader listingLoader = context.watch<ListingLoader>();

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(title: const Text('Car Reels')),
        body: Column(
>>>>>>> c581d165e90c70d0b07a323af834ec0bb8f8026f
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: listingLoader.listings.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    height: MediaQuery.of(context).size.height * 0.2,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xffe8e8e8),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      boxShadow: kElevationToShadow[4],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ChangeNotifierProvider.value(
                                  value: context.read<ListingLoader>(),
                                  child: carPage(
                                    context
                                        .read<ListingLoader>()
                                        .listings[index],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25.0),
                                ),
                              ),
                              child: Reel(listingLoader.listings[index]),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listingLoader.listings[index].brand,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    Text(
                                      listingLoader.listings[index].model,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                    Text(
                                      '\$${listingLoader.listings[index].price}',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              // crossAxisCount: 2,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MultiProvider(
                    providers: [
                      Provider.value(
                        value: context.read<CameraInfos>(),
                      ),
                      ChangeNotifierProvider.value(
                        value: context.read<ListingLoader>(),
                      ),
                    ],
                    child: const RecordingScreen(),
                  );
                },
              ),
            );
          },
          child: const Text(
            "+",
            textScaleFactor: 2,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_balance_wallet),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            ],
          ),
        ),
      ),
    );
  }
}

class RecordButton extends StatelessWidget {
  const RecordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('+'),
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
    );
  }
}
