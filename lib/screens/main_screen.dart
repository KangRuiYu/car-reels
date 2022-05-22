import 'package:car_reels/models/camera_infos.dart';
import 'package:flutter/material.dart';
import 'package:car_reels/screens/recording_screen.dart';
import 'package:provider/provider.dart';
import 'package:car_reels/screens/search_page.dart';

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
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return GestureDetector(
      onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
      child: Scaffold(
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: TextField(
                    cursorWidth: 3,
                    cursorRadius: Radius.circular(180),
                    textAlign: TextAlign.center,
                    controller: _controller,
                    onSubmitted: (value){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SearchPage(textController: _controller)));},
                    decoration: InputDecoration(
                      isDense: false,
                      contentPadding: EdgeInsets.only(left: 5),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: IconButton(
                        onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SearchPage(textController: _controller)));},
                        icon: Icon(Icons.search),
                        color: Colors.blue,
                        iconSize: 25,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _controller.clear,
                        icon: Icon(Icons.clear),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(180)
                      ),
                      hintText: 'Enter your search',


                    ),
                  ),

                ),
              ),


              Expanded(
                child: GridView.count(
=======
    ListingLoader listingLoader = context.watch<ListingLoader>();

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(title: const Text('Car Reels')),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
>>>>>>> 85876b9b8f7eaecbb2c5e413426c8ee347505fcf
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
