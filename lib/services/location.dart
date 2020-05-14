import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Location({this.latitude, this.longitude});

  Future<void> getCurrentPosition() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
      return "error";
    }
  }
}