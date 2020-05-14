import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'ed72bb9f3e0b5e607e85fb8a6f251e96';
const baseURL= 'https://api.openweathermap.org/data/2.5/weather';
//api.openweathermap.org/data/2.5/weather?id={city id}&appid={your api key}
//api.openweathermap.org/data/2.5/weather?q=London


class WeatherModel {


  Future<dynamic> getCityWeather(city) async{
    NetworkHelper networkHelper = NetworkHelper(
        '$baseURL?q=$city&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentPosition();

    NetworkHelper networkHelper = NetworkHelper(
        '$baseURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
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

  String getMessage(var temp) {
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
