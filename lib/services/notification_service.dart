import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:news/locator.dart';
import 'package:news/services/api_service.dart';
import 'package:news/utils/utils.dart';

class NotificationsService {

  final ApiService _apiService = locator<ApiService>();

  /// Initialize the notification service.
  void initialize() async {
    await _requestPermission();
    _onPushNotificationReceived();
    _onTokenRefresh();
    _getToken();
    _onInitialMessageReceived();
    _subscribeToTopic();
  }

  void _subscribeToTopic() {
    FirebaseMessaging.instance.subscribeToTopic('new-article-en');
  }

  /// Get the initial message when the app is opened from a terminated state.
  void _onInitialMessageReceived() {
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) async {
      if (message != null) {
        _onNotificationReceived(message);
      }
    });
  }

  /// Get the token from the device.
  void _getToken() {
    FirebaseMessaging.instance.getToken().then((String? fcmToken) async {
      _onTokenUpdated(fcmToken);
    });
  }

  /// Refresh the token.
  void _onTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((String fcmToken) async {
      _onTokenUpdated(fcmToken);
    }).onError((err) {
    });
  }

  /// Listen to push notifications.
  void _onPushNotificationReceived() {

    // Receive messages in the foreground.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _onNotificationReceived(message);
    });

    // Receive messages in the background.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      _onNotificationReceived(message);
    });
  }

  /// Request permission to receive push notifications.
  Future<void> _requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();
  }

  /// Handle the token when it is updated. Send it to the server.
  void _onTokenUpdated(String? token) {
    if (token != null) {
      _apiService.updateToken(token);
    }
  }

  /// Handle the notification when it is received. For now, just show a snackbar.
  void _onNotificationReceived(RemoteMessage message) {
    Utils.showSnackBar(title: message.notification?.title ?? '', body: message.notification?.body ?? '');
  }
}
