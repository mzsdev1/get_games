import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_games/utils/constants/enums/locales.dart';

class InitLocalizations extends EasyLocalization {
  InitLocalizations({
    super.key,
    required super.child,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _path,
          useOnlyLangCode: true,
          fallbackLocale: Locales.en.locale,
        );

  static final List<Locale> _supportedLocales =
      Locales.values.map((e) => e.locale).toList();

  static const String _path = "assets/translations";

  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
