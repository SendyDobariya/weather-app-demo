part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

// class WeatherLoading extends WeatherState {
//   final WeatherModel weather;
//   const WeatherLoading([this.weather]);
// }

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;
  const WeatherLoaded(this.weather);
  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  final String message;
  final WeatherModel? weather;
  const WeatherError(this.message, [this.weather]);
  @override
  List<Object?> get props => [message, weather];
}
