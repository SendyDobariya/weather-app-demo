import 'package:bloc_pub/Bloc/CounterBlocProvider.dart';
import 'package:bloc_pub/Bloc/UserBlocProvider.dart';
import 'package:bloc_pub/Bloc/WeatherBloc/weather_bloc.dart';
import 'package:bloc_pub/Const/RouteNames.dart';
import 'package:bloc_pub/Cubit/WeatherCubit/weather_cubit.dart';
import 'package:bloc_pub/Repository/WeatherRepository.dart';
import 'package:bloc_pub/Screens/ApiListingScreen.dart';
import 'package:bloc_pub/Screens/HomeScreen.dart';
import 'package:bloc_pub/Screens/UserScreen.dart';
import 'package:bloc_pub/Screens/WeatherBlocScreen.dart';
import 'package:bloc_pub/Screens/WeatherCubitScreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider<CounterBlocProvider>(
                      create: (BuildContext context) => CounterBlocProvider()),
                  BlocProvider<UserBlocProvider>(
                      create: (BuildContext context) => UserBlocProvider()),
                ], child: HomeScreen()),
            settings: settings);

      case UserRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<UserBlocProvider>(
                  create: (BuildContext context) => UserBlocProvider(),
                  child: UserScreen(),
                ),
            settings: settings);

      case ApiListingRoute:
        return MaterialPageRoute(
            builder: (_) => ApiListingScreen(), settings: settings);

      case WeatherCubitRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<WeatherCubit>(
                  create: (BuildContext context) =>
                      WeatherCubit(FakeWeatherRepository()),
                  child: WeatherCubitScreen(),
                ),
            settings: settings);

      case WeatherBlocRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<WeatherBloc>(
                  create: (BuildContext context) =>
                      WeatherBloc(FakeWeatherRepository()),
                  child: WeatherBlocScreen(),
                ),
            settings: settings);

      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
