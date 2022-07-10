import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WeatherModel extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [cityName, temperatureCelsius];

  final String cityName;
  final double temperatureCelsius;

  WeatherModel({
    required this.cityName,
    required this.temperatureCelsius,
  });
}
