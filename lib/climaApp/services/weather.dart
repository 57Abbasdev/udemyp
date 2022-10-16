import 'package:udemyp/climaApp/services/location.dart';

import 'networking.dart';
const key = '337fc5be66f6b2cbba8e4ebed0cdfebc';
const baseUrl ='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$baseUrl?q=$cityName&appid=$key&units=metric');

    var weatherData = await networkHelper.getJsonData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    AppLocation location = AppLocation();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$key&units=metric');

    var weatherData = await networkHelper.getJsonData();
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
