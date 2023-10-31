import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_games/constants/enums/locales.dart';

class InitLocalizations extends EasyLocalization {
  InitLocalizations({
    super.key,
    required super.child,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _path,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedLocales = [
    Locales.en.locale,
    Locales.tr.locale,
  ];

  static const String _path = "assets/translations";

  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
