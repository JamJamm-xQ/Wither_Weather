import 'package:geolocator/geolocator.dart';

class LocationInfo {
  late String positionUpdate = 'Location';
  double latitudeSto = 0.00;
  double longitudeSto = 0.00;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      positionUpdate = position.toString();

      latitudeSto = position.latitude;
      longitudeSto = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
