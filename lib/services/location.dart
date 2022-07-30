import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location {
  late bool serviceEnabled;
  late LocationPermission permission;

  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      log((3 + 9).toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
