import 'dart:io';

class Listing {
  String name = "";
  String price = "";
  String year = "";
  String mileage = "";
  String emissionType = "";
  String condition = "";
  String mpg = "";
  String engine = "";
  String horsePower = "";

  Directory imageDir = Directory('');

  Listing(Directory dir) {
    if (File('${dir.path}/info.txt').existsSync()) {
      List<String> info = File('${dir.path}/info.txt').readAsLinesSync();
      name = info[0];
      price = info[1];
      year = info[2];
      mileage = info[3];
      emissionType = info[4];
      condition = info[5];
      mpg = info[6];
      engine = info[7];
      horsePower = info[8];
    }
    imageDir = Directory('${dir.path}/images');
  }
}
