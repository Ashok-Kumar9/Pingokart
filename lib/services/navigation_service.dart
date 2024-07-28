import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> navigateToAndRemoveUntil(
      String routeName, RoutePredicate predicate,
      {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  static void goBack() {
    return navigatorKey.currentState!.pop();
  }
}
