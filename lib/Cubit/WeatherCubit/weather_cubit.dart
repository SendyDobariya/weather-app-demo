import 'package:bloc/bloc.dart';
import 'package:bloc_pub/Models/WeatherModel.dart';
import 'package:bloc_pub/Repository/WeatherRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;
  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    print("Cubit getWeather calling for $cityName");
    try {
      // if (state is WeatherInitial || state is WeatherError) {
      //   emit(WeatherLoading());
      // } else {
      //   WeatherModel x = (state as WeatherLoaded).weather;
      //   emit(WeatherLoading(x));
      // }

      final WeatherModel weather =
          await _weatherRepository.fetchWeather(cityName);

      emit(WeatherLoaded(weather));
    } on NetworkException {
      if (state is WeatherLoaded) {
        WeatherModel x = (state as WeatherLoaded).weather;
        emit(WeatherError(
            "Couldn't fetch weather for $cityName. Is the device online?", x));
      } else if (state is WeatherError) {
        WeatherModel? x = (state as WeatherError).weather;
        emit(WeatherError(
            "Couldn't fetch weather for $cityName. Is the device online?", x));
      } else {
        emit(WeatherError(
          "Couldn't fetch weather for $cityName. Is the device online?",
        ));
      }
    }
  }
}
