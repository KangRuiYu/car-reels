import 'package:car_reels/models/camera_infos.dart';
import 'package:car_reels/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_reels/screens/recording_screen.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController textController;
  const SearchPage({Key? key, required this.textController}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();

}

class _SearchPageState extends State<SearchPage> {
  List searchResults = [];

  @override
  Widget build(BuildContext context) {
    var _controller = widget.textController;
    void _makeSearchObject(List searches, String manufactor, String model) {
      searches.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.grey.shade200
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.black)
                    )
                )
            ),
          onPressed: (){}, //TODO Link Car Pages
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network("https://www.carlogos.org/car-logos/nio-logo-1800x700-show.png")),
              ),
                  Text(manufactor + "     ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text("Model: " + model,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black

                  )),
            ],
          ),
        ),
      )
      );
    }
    return Scaffold(
          appBar: AppBar(title: const Text('Car Reels')),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                    height: 50,
                    width: 70,
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: kElevationToShadow[8],
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(45))),
                        child: new Center(
                          child: new Text("Price",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                    height: 50,
                    width: 100,
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: kElevationToShadow[8],
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(45))),
                        child: new Center(
                          child: new Text("Manufactor",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                    height: 50,
                    width: 70,
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: kElevationToShadow[8],
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(45))),
                        child: new Center(
                          child: new Text("Year",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                    height: 50,
                    width: 80,
                    color: Colors.transparent,
                    child: Container(
                        decoration: BoxDecoration(
                            boxShadow: kElevationToShadow[8],
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(45))),
                        child: new Center(
                          child: new Text("Mileage",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,),
                        )),
                  ),


                ],
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  height: 44,
                  decoration: BoxDecoration(
                      color: Colors.grey, borderRadius: BorderRadius.circular(25)),

                  child: TextField(
                    onSubmitted: (value){setState((){_makeSearchObject(searchResults, "Nio", "NIO ET7");});},
                    cursorColor: Colors.white,
                    cursorWidth: 3,
                    cursorRadius: Radius.circular(180),
                    style: TextStyle(
                      color: Colors.white
                    ),
                    controller: _controller,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.only(top: 10),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          color: Colors.white,
                          onPressed: () {
                            if(_controller.text == "")
                              {
                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MainScreen()));
                              }
                            else
                              {
                                _controller.clear();
                              }
                          },
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ),
      ...searchResults
       ],
              )
    );
  }
}