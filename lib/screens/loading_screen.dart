import 'package:flutter/material.dart';
import 'package:wither_weather/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    //getLocation();
  }

  void getLocation() async {
    await locationInfo.getCurrentLocation();
    print(locationInfo.positionUpdate);

    latitude = locationInfo.latitudeSto;
    print(latitude);

    longitude = locationInfo.longitudeSto;
    print(longitude);
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&appid=$apiKey"));

    if (response.statusCode == 200) {
      String data = response.body;
      // print(data);
      var weatherdescription =
          jsonDecode(data)['current']['weather'][0]['description'];

      var jsDec = jsonDecode(data);

      double tempurature = jsDec['current']['temp'];
      int condition = jsDec['current']['weather'][0]['id'];
      String cityName = jsDec['timezone'];

      print(
          "General Overview of $cityName: $weatherdescription,\n Weather ID: $condition, \n Temp: $tempurature");
    } else {
      print(response.statusCode);
    }

    // print(response.body);
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
    getLocation();
    getData();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationInfo.positionUpdate),
            ElevatedButton(
              onPressed: () {
                //Get the current location
                // checkLocationEnabledStatus();

                setState(() {
                  getLocation();
                  //
                });
              },
              child: const Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
