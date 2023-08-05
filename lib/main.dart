import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:news/services/navigation_service.dart';
import 'package:news/services/notification_service.dart';
import 'package:news/theme/style.dart';
import 'package:news/views/all_articles.dart';

import 'locator.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationsService notificationService = locator.get<NotificationsService>();
  notificationService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Best News',
      theme: appLightTheme(),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      home: GestureDetector(
          onTap: () {
            // Dismiss soft keyboard when tapping outside of input field
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: AllArticlesPage()),
    );
  }
}
