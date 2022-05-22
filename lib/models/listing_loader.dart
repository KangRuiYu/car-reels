import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'listing.dart';

class ListingLoader extends ChangeNotifier {
  List<Listing> listings = [];

  bool get doneLoading => _doneLoading;
  bool _doneLoading = false;

  var _storageRef;

  Future<void> loadListings() async {
    Directory? storageDir = await getExternalStorageDirectory();
    if (storageDir == null) return;

    _storageRef = FirebaseStorage.instance.ref();

    List<DownloadTask> downloadTasks = [];
    var listResults = await _storageRef.listAll();
    for (var prefix in listResults.prefixes) {
      if (!Directory('${storageDir.path}/${prefix.name}').existsSync()) {
        await Directory('${storageDir.path}/${prefix.name}')
            .create(recursive: true);
        await Directory('${storageDir.path}/${prefix.name}/images')
            .create(recursive: true);

        Reference infoRefToGet = prefix.child('info.txt');
        File infoFileToWrite = File(
          '${storageDir.path}/${prefix.name}/info.txt',
        );
        await infoFileToWrite.create(recursive: true);
        downloadTasks.add(infoRefToGet.writeToFile(infoFileToWrite));

        ListResult innerListResults = await prefix.child('images').listAll();

        for (Reference image in innerListResults.items) {
          File imageFileToWrite = File(
            '${storageDir.path}/${prefix.name}/images/${image.name}',
          );
          await imageFileToWrite.create(recursive: true);
          downloadTasks.add(image.writeToFile(imageFileToWrite));
        }
      }
    }

    await for (FileSystemEntity dir in storageDir.list()) {
      if (dir is Directory) {
        if (dir.listSync().isEmpty) {
          dir.delete(recursive: true);
        } else {
          listings.add(Listing(dir));
        }
      }
    }

    await Future.wait(downloadTasks);
    _doneLoading = true;
    notifyListeners();
  }

  void addListing(Directory dir) {
    listings.add(Listing(dir));
    notifyListeners();
  }
}
