import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_games/notifications/firebase_api.dart';

class PermissionStatus {
  Future<void> acPerm() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus != AuthorizationStatus.authorized) {
      await FirebaseAPI().initNotifications();
      print(settings.authorizationStatus);
    }
  }
}
