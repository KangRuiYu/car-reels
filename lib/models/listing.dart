import 'dart:io';

class Listing {
  String get brand => _brand;
  String _brand = "";

  String get model => _model;
  String _model = "";

  int get price => _price;
  int _price = 0;

  Directory get imageDir => _imageDir;
  Directory _imageDir = Directory('');

  Listing(Directory dir) {
    List<String> info = File('${dir.path}/info.txt').readAsLinesSync();
    _brand = info[0];
    _model = info[1];
    _price = int.parse(info[2]);
    _imageDir = Directory('${dir.path}/images');
  }
}
