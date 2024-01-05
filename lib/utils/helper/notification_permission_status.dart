import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/firebase/notifications/notification_initializer.dart';

class NotificationPermissionStatus {
  Future<void> acceptPermission(BuildContext context) async {
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
      await NotificationService().initNotifications();

      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(LocaleKeys.snackbarTexts_permissionAccepted.tr()),
          ),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(LocaleKeys.snackbarTexts_permissionAlreadyAccepted.tr()),
          ),
        );
      }
    }
  }
}
