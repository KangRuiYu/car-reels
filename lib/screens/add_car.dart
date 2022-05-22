import 'package:flutter/material.dart';

class CarForm extends StatefulWidget {
  const CarForm({Key? key}) : super(key: key);

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  // This widget is the root of your application.
  List<Widget> _strings = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Car Listing',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text('Add Car Listing'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.add)),
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
                        child: Column(children: [
                          ElevatedButton(
                              onPressed: () {},
                              child: const Icon(Icons.camera_alt_outlined)),
                        ]),
                      ),
                      // Col 2
                      Expanded(
                        flex: 10,
                        child: Column(children: const [
                          SizedBox(
                            width: 180,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ex: Tesla Roadster',
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
                    SizedBox(
                      width: 80,
                      child: TextField(
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
                  child: Column(children: const [
                    SizedBox(
                      width: 100,
                      child: TextField(
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
                      children: const [
                        SizedBox(
                          width: 80,
                          child: TextField(
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
                          child: Column(children: const [
                            SizedBox(
                              width: 140,
                              child: TextField(
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
                          child: Column(children: const [
                            SizedBox(
                              width: 140,
                              child: TextField(
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
                          child: Column(children: const [
                            SizedBox(
                              width: 140,
                              child: TextField(
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
                          child: Column(children: const [
                            SizedBox(
                              width: 140,
                              child: TextField(
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
                          child: Column(children: const [
                            SizedBox(
                              width: 140,
                              child: TextField(
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
