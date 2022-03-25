import 'package:flutter/material.dart';
import 'package:wither_weather/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // gradient: RadialGradient(
          //   center: Alignment(-0.9, -0.9), // near the top right
          //   radius: 0.7,
          //   colors: [Colors.yellow, Colors.blue],
          //   //focal: Alignment.topLeft,
          //   stops: <double>[0.4, 1.0],
          // ),
            image: DecorationImage(
              image: const AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: const <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '32°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
               const Padding(
                 padding: EdgeInsets.only(right: 15.0),
                 child: Text(
                  "It's 🍦 time in San Francisco!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
              ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}



    // var jsDec = jsonDecode(data);
    // double tempurature = jsDec['current']['temp'];
    // int condition = jsDec['current']['weather'][0]['id'];
    // String cityName = jsDec['timezone'];

    // print(
    //     "General Overview of $cityName: $weatherdescription,\n Weather ID: $condition, \n Temp: $tempurature");