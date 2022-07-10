import 'package:flutter/material.dart';

class AppRouteObserver extends RouteObserver {
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    print(
        "didPop ==>> previous : ${route?.settings.name} || current : ${previousRoute?.settings.name}");

    super.didPop(previousRoute!, route);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print(
        "didPush ==>> previous : ${previousRoute?.settings.name} || current : ${route.settings.name}");

    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print(
        "didReplace ==>> replace : ${oldRoute?.settings.name} with : ${newRoute?.settings.name}");
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
