import 'dart:io';

import 'package:car_reels/models/camera_infos.dart';
import 'package:car_reels/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:car_reels/screens/recording_screen.dart';
import 'package:provider/provider.dart';

import '../models/listing_loader.dart';
import '../widgets/reel.dart';
import 'add_car.dart';
import 'car.dart';

void main() => runApp(const MainScreen());

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
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
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String city = "City";
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ListingLoader listingLoader = context.watch<ListingLoader>();

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Text('CarReels'),
                Spacer(),
                Container(
                  child: Image.asset('assets/offwhite_icon.png'),
                  width: 25,
                  height: 25,
                ),
              ],
            ),
            elevation: 0,
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.black),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  right: 10,
                  left: 10,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: TextField(
                    cursorWidth: 3,
                    cursorRadius: Radius.circular(180),
                    textAlign: TextAlign.center,
                    controller: _controller,
                    onSubmitted: (value) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => SearchPage(
                            textController: _controller,
                          ),
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      isDense: false,
                      contentPadding: EdgeInsets.only(left: 5),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => SearchPage(
                                textController: _controller,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.search),
                        color: Colors.blue,
                        iconSize: 25,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _controller.clear,
                        icon: Icon(Icons.clear),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(180)),
                      hintText: 'Enter your search',
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton(
                    value: city,
                    items: <String>[
                      "City",
                      "Irvine",
                      "San Francisco",
                      "Baldwin Park",
                      "New York",
                      "Chicago",
                      "Seattle",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          city = newValue!;
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
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
                        color: const Color(0xfff8f8f8),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listingLoader.listings[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      Text(
                                        listingLoader.listings[index].year,
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
                      child: const CarForm(),
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
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SearchPage(
                          textController: _controller,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.search),
                ),
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
      ),
    );
  }
}
