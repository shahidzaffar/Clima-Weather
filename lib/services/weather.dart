import 'package:clima/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '0876ae926d5c8d91e700f28c2735b245';
const urlConst='https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

  Future<dynamic> getWeatherData() async
  {
    LocationLoader locationLoader = LocationLoader();
    await locationLoader.getLocation();

    NetworkingHelper networkingHelper = NetworkingHelper(
        url:
        '$urlConst?lat=${locationLoader.latitude}'
            '&lon=${locationLoader.longitude}&appid=$apiKey&units=metric');

    var locationData = await networkingHelper.getData();
    return locationData;
  }



  Future<dynamic> getCityWeather(String cityName) async
  {


    NetworkingHelper networkingHelper = NetworkingHelper(
        url:
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var locationData = await networkingHelper.getData();
    return locationData;
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
