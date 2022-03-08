import 'package:geolocator/geolocator.dart';

class LocationInfo {
  late String positionUpdate = 'Location';
  late double latitudeSto;
  late double longitudeSto;

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
