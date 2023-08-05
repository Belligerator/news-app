import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic>? pushNamed(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }

  Future<dynamic>? push(Route route) {
    return navigatorKey.currentState?.push(route);
  }
}
