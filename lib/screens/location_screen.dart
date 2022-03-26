import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wither_weather/utilities/constants.dart';
import 'package:wither_weather/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({this.locationWeather});
  final dynamic locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //Ideally, I should've used the "late" keyword but that would make my variables
  //unitialized, hence, providing a null value which is unacceptable.
  WeatherModel weather = WeatherModel();
  int tempurature = 0;
  // int condition = 0;
  String weatherIcon = "";
  String weatherActivity = "";
  String cityName = "";
  String weatherDescription = "";

  get onPressed => null;

  @override
  void initState() {
    super.initState();
    uiUpdate(widget.locationWeather);
    // print("From location weather: ${widget.locationWeather}");
  }

  void uiUpdate(dynamic weatherData2) {
    setState(() {
      double temp = weatherData2['current']['temp'];
      tempurature = temp.toInt();
      weatherActivity = weather.getMessage(tempurature);
      print("Temp: $tempurature");

      var condition = weatherData2['current']['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      String timezone = weatherData2['timezone'];

      cityName = timezone.substring(timezone.indexOf('/') + 1);
      print(cityName);

      weatherDescription = weatherData2['current']['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          /*gradient: RadialGradient(
            center: Alignment(-0.9, -0.9), // near the top right
            radius: 0.7,
            colors: [Colors.yellow, Colors.blue],
            //focal: Alignment.topLeft,
            stops: <double>[0.4, 1.0],
          ),*/

          gradient: LinearGradient(
              colors: [Color(0xFF13225A), Color(0xFF9662A2)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),

          /*image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),*/
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
                    onPressed: () {
                      uiUpdate(widget.locationWeather);
                    },
                    child: const Icon(
                      Icons.refresh,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'It\'s $tempurature°',
                      style: kTempTextStyle,
                    ),
                    Row(
                      children: <Widget>[
                        // const SizedBox(
                        //   width: 10.0,
                        // ),
                        Text(
                          'with $weatherDescription ',
                          style: kWeatherDescriptionTextStyle,
                        ),
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherActivity in $cityName!",
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



  

    // print(
    //     "General Overview of $cityName: $weatherdescription,\n Weather ID: $condition, \n Temp: $tempurature");