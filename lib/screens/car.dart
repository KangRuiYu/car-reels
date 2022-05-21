import 'package:flutter/material.dart';

class carPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Name',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text('Car Screen'),
          ),
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
              height: 275,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://image.made-in-china.com/2f0j00jsTRSMVnLrce/EV-Car.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
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
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            minRadius: 25.0,
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
                            children: const [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                minRadius: 25.0,
                                child: Icon(
                                  Icons.fullscreen,
                                  size: 25.0,
                                ),
                              ),
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
                  child: Column(children: const [
                    Text(
                      '2017',
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
                  child: Column(children: const [
                    Text(
                      '\$25,600',
                      style: TextStyle(
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
                      children: const [
                        Text(
                          '120k',
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
                              'Trim',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),

                        // Spacer Col
                        Expanded(
                          flex: 2,
                          child: Column(children: const []),
                        ),

                        // Col 2
                        Expanded(
                          flex: 5,
                          child: Column(children: const [
                            Text(
                              'Season O2 Premium',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ]),
                        ),
                        // Spacer Col
                        Expanded(
                          flex: 0,
                          child: Column(children: const []),
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
