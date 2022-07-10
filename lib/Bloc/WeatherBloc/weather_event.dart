part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

//Need to declate events here which will going to acc.
class GetWeather extends WeatherEvent {
  final String cityname;
  GetWeather(this.cityname);
}
