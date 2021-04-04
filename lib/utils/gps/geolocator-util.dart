/*
import 'package:geolocator/geolocator.dart';

class GeolocatorUtil {
  static Future<Position> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      throw e;
    }
  }

  static Future<String> getAddressFromGPS(Position position) async {
    try {
      List<Placemark> placemarks =
          await Geolocator().placemarkFromPosition(position);
      Placemark placemark = placemarks.first;
      List<String> remarks = [];
      if (placemark.thoroughfare.isNotEmpty) {
        remarks.add(placemark.thoroughfare);
      }
      if (placemark.subAdministrativeArea.isNotEmpty) {
        remarks.add(placemark.subAdministrativeArea);
      }
      if (placemark.administrativeArea.isNotEmpty) {
        remarks.add(placemark.administrativeArea);
      }
      if (placemark.country.isNotEmpty) {
        remarks.add(placemark.country);
      }
      return remarks.toString().replaceAll("]", "").replaceAll("[", "");
    } catch (e) {
      throw e;
    }
  }

  static Future<String> getDistance(
      Position origin, Position destination) async {
    try {
      double distance = await Geolocator().distanceBetween(origin.latitude,
          origin.longitude, destination.latitude, destination.longitude);

      return "${(distance / 1000).toStringAsFixed(2)} KM";
    } catch (e) {
      throw e;
    }
  }

  static Future<double> getDistanceDouble(
      Position origin, Position destination) async {
    try {
      double distance = await Geolocator().distanceBetween(origin.latitude,
          origin.longitude, destination.latitude, destination.longitude);

      return (distance / 1000.0);
    } catch (e) {
      throw e;
    }
  }
}
*/
