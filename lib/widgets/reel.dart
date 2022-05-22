import 'dart:io';

import 'package:flutter/material.dart';

import '../models/listing.dart';

class Reel extends StatefulWidget {
  final Listing listing;

  Reel(this.listing);

  @override
  State<Reel> createState() => _ReelState();
}

class _ReelState extends State<Reel> {
  List<Image> _imageFiles = [];
  bool _imagesLoaded = false;
  int _imageIndex = 0;
  double _scrolledAmount = 0;

  @override
  void initState() {
    super.initState();
    _loadImageFiles();
  }

  Future<void> _loadImageFiles() async {
    await for (FileSystemEntity imageFile in widget.listing.imageDir.list()) {
      _imageFiles.add(Image.file(
        imageFile as File,
        gaplessPlayback: true,
      ));
    }
    _imagesLoaded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(_imageFiles);
    if (_imagesLoaded) {
      return GestureDetector(
        child: _imageFiles[_imageIndex],
        onHorizontalDragUpdate: (details) {
          setState(
            () {
              _scrolledAmount += details.primaryDelta ?? 0;

              if (_scrolledAmount > 15) {
                _scrolledAmount -= 15;
                _imageIndex++;
              } else if (_scrolledAmount < -15) {
                _scrolledAmount += 15;
                _imageIndex--;
              }

              _imageIndex %= _imageFiles.length;
            },
          );
        },
      );
    } else {
      return Container();
    }
  }
}
