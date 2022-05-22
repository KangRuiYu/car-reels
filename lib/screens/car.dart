import 'package:car_reels/widgets/reel.dart';
import 'package:flutter/material.dart';

import '../models/listing.dart';

class carPage extends StatelessWidget {
  // This widget is the root of your application.
  final Listing _listing;

  carPage(this._listing);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('${_listing.name}'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.attach_money)),
        body: ListView(
          children: <Widget>[
            Container(
              child: Stack(
                children: [
                  Reel(_listing),
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
                            child: Column(children: const [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  minRadius: 25.0,
                                ),
                              ),
                            ]),
                          ),
                          // Col 2
                          Expanded(
                            flex: 10,
                            child: Column(children: const []),
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
                            ),
                          ),
                        ],
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
            const SizedBox(
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
                    Text(
                      _listing.year,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ]),
                ),
                // Col 2
                Expanded(
                  flex: 4,
                  child: Column(children: [
                    Text(
                      '\$${_listing.price}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ]),
                ),
                // Col 3
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          _listing.mileage,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
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
                          flex: 2,
                          child: Column(children: const [
                            Text(
                              'Emission Type: ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),

                        // Col 2
                        Expanded(
                          flex: 2,
                          child: Column(children: [
                            Text(
                              _listing.emissionType,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Col 1
                        Expanded(
                          flex: 2,
                          child: Column(children: const [
                            Text(
                              'Condition: ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),

                        // Col 2
                        Expanded(
                          flex: 2,
                          child: Column(children: [
                            Text(
                              _listing.condition,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Col 1
                        Expanded(
                          flex: 2,
                          child: Column(children: const [
                            Text(
                              'MPG: ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),
                        // Col 2
                        Expanded(
                          flex: 2,
                          child: Column(children: [
                            Text(
                              _listing.mpg,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),
                        // Spacer Col
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Col 1
                        Expanded(
                          flex: 2,
                          child: Column(children: const [
                            Text(
                              'Engine: ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),
                        // Col 2
                        Expanded(
                          flex: 2,
                          child: Column(children: [
                            Text(
                              _listing.engine,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),
                        // Spacer Col
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // Col 1
                        Expanded(
                          flex: 2,
                          child: Column(children: const [
                            Text(
                              'Horsepower: ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),

                        // Col 2
                        Expanded(
                          flex: 2,
                          child: Column(children: [
                            Text(
                              _listing.horsePower,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),
                        // Spacer Col
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
