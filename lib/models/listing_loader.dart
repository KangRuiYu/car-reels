import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'listing.dart';

class ListingLoader extends ChangeNotifier {
  List<Listing> listings = [];

  bool get doneLoading => _doneLoading;
  bool _doneLoading = false;

  Future<void> loadListings() async {
    Directory? storageDir = await getExternalStorageDirectory();
    if (storageDir == null) return;

    await for (FileSystemEntity dir in storageDir.list()) {
      if (dir is Directory) {
        listings.add(Listing(dir));
      }
    }

    _doneLoading = true;
    notifyListeners();
  }

  void addListing(Directory dir) {
    listings.add(Listing(dir));
    notifyListeners();
  }
}
