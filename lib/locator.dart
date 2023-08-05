import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news/services/api_service.dart';
import 'package:news/services/navigation_service.dart';
import 'package:news/services/notification_service.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => NotificationsService());
  locator.registerSingletonAsync<ApiService>(() async => ApiService().initialize());
}
