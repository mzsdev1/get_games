// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/notifications/firebase_api.dart';

class PermissionStatus {
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
      await FirebaseAPI().initNotifications();

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.snackbarTexts_permissionAccepted.tr()),
        ),
      );
    } else {
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
