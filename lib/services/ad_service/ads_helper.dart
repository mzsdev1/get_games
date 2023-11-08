import 'dart:io';

class AdsHelper {
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-9317560027150133/8683849778";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
