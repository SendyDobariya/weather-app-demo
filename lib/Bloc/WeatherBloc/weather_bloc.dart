import 'package:bloc/bloc.dart';
import 'package:bloc_pub/Models/WeatherModel.dart';
import 'package:bloc_pub/Repository/WeatherRepository.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    print("EVENTS AT WEATHER BLOC =>$event");
    if (event is GetWeather) {
      try {
        final WeatherModel weather =
            await _weatherRepository.fetchWeather(event.cityname);

        yield WeatherLoaded(weather);
      } on NetworkException {
        if (state is WeatherLoaded) {
          WeatherModel x = (state as WeatherLoaded).weather;
          yield WeatherError(
              "Couldn't fetch weather for ${event.cityname}. Is the device online?",
              x);
        } else if (state is WeatherError) {
          WeatherModel? x = (state as WeatherError).weather;
          yield WeatherError(
              "Couldn't fetch weather for ${event.cityname}. Is the device online?",
              x);
        } else {
          yield WeatherError(
            "Couldn't fetch weather for ${event.cityname}. Is the device online?",
          );
        }
      }
    }
  }
}
