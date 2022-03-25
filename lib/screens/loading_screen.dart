import 'package:flutter/material.dart';
import 'package:wither_weather/screens/location_screen.dart';
import 'package:wither_weather/services/location.dart';
import 'package:wither_weather/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

String apiKey = "5bb36c4b06b0a26617c3fa1f96b4658e";

LocationInfo locationInfo = LocationInfo();

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.00;
  double longitude = 0.00;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    await locationInfo.getCurrentLocation();
    print(locationInfo.positionUpdate);

    latitude = locationInfo.latitudeSto;
    print(latitude);

    longitude = locationInfo.longitudeSto;
    print(longitude);

    NetworkAid networkAid = NetworkAid(
        "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&appid=$apiKey");

    var weatherData = await networkAid.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  /* void checkLocationEnabledStatus() async {
    //Checks and requests for location if denied or unavailable.
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    print(isLocationServiceEnabled);
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    Position currentPosition = position;
    print(currentPosition);

    //Ask Device Permission
    // Future<void> requestPermission() async {
    //   await Permission.location.request();
    // }

    // ;
    // LatLng LatLngposition = LatLng(position.latitude, position.longitude);
  }*/

  @override
  Widget build(BuildContext context) {
    getLocationData();

    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.grey[500],
          size: 70.0,
        ),
      ),
    );
  }
}


/*
Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationInfo.positionUpdate),
            ElevatedButton(
              onPressed: () {
                //Get the current location
                // checkLocationEnabledStatus();

                setState(() {
                  getLocationData();
                  //
                });
              },
              child: const Text('Get Location'),
            ),
          ],
        ),
      )
*/