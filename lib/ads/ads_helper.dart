import 'dart:io';

class AdsHelper {
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      // return "ca-app-pub-9317560027150133/8683849778";
      return "ca-app-pub-3940256099942544/1033173712";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
