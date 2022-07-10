import 'package:bloc_pub/Const/RouteNames.dart';
import 'package:bloc_pub/Navigation/AppRouteObserver.dart';
import 'package:bloc_pub/Navigation/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc Pub",
      debugShowCheckedModeBanner: false,
      navigatorObservers: [AppRouteObserver()],
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: HomeRoute,
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc? bloc, Object? event) {
    super.onEvent(bloc!, event);
    print("EVENTS OBSERVER => $event");
  }
}
