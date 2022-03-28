import 'package:flutter/material.dart';
import 'package:wither_weather/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wither_weather/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // latitude = locationInfo.latitudeSto;
    // // print(latitude);

    // longitude = locationInfo.longitudeSto;
    // print(longitude);

    var weatherData = await WeatherModel().getLocationNetwork();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
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