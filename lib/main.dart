import 'package:flutter/material.dart';
import 'package:wither_weather/screens/city_screen.dart';
import 'package:wither_weather/screens/loading_screen.dart';
import 'package:wither_weather/screens/location_screen.dart';
import 'package:wither_weather/screens/splash_screen.dart';

void main() => runApp(const WWY());

class WWY extends StatelessWidget {
  const WWY({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weathering With You',
      theme: ThemeData.dark(),
       initialRoute: '/',
        routes: {
          "/": (context) => const Splash(),
          "/loadingscreen": (context) => const LoadingScreen(),
          "/cityscreen": (context) => const CityScreen(),
          "/locationscreen": (context) => const LocationScreen(),
        }
    );
  }
}