import 'package:bloc_pub/Models/WeatherModel.dart';
import "dart:math";

abstract class WeatherRepository {
  /// Throws [NetworkException].
  Future<WeatherModel> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<WeatherModel> fetchWeather(String cityName) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkException();
        }

        // Return "fetched" weather
        return WeatherModel(
          cityName: cityName,
          // Temperature between 20 and 35.99
          temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble(),
        );
      },
    );
  }
}

class NetworkException implements Exception {}
