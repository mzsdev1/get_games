import 'package:flutter/widgets.dart';

enum Locales {
  en(Locale('en', 'US')),
  tr(Locale('tr', 'TR')),
  pt(Locale('pt', 'BR')),
  es(Locale('es', 'ES')),
  de(Locale('de', 'DE')),
  fr(Locale('fr', 'FR')),
  vn(Locale('vi', 'VN'));

  final Locale locale;

  const Locales(this.locale);
}
