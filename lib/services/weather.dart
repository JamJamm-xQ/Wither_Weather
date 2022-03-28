import 'package:wither_weather/services/location.dart';
import 'package:wither_weather/services/networking.dart';

const String apiKey = "5bb36c4b06b0a26617c3fa1f96b4658e";
const String apiUrlLatLong = "https://api.openweathermap.org/data/2.5/onecall";

const String apiUrlForCity = "https://api.openweathermap.org/data/2.5/weather";

LocationInfo locationInfo = LocationInfo();


class WeatherModel {
  Future<dynamic> getWeatherFromCity(String cityName) async {
        NetworkAid networkAid = NetworkAid(
        "$apiUrlForCity?q=$cityName&appid=$apiKey&units=metric");

    var weatherData3 = await networkAid.getData();
    return weatherData3;
  }

  Future<dynamic> getLocationNetwork() async {
    await locationInfo.getCurrentLocation();
    print(locationInfo.positionUpdate);

    NetworkAid networkAid = NetworkAid(
        "$apiUrlLatLong?lat=${locationInfo.latitudeSto}&lon=${locationInfo.longitudeSto}&appid=$apiKey&units=metric");

    var weatherData = await networkAid.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
