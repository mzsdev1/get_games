import 'package:get_games/utils/constants/string_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsTileFunctions {
  SettingsTileFunctions();

  final Uri _url = Uri.parse(StringConstants.privacyLink);

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: StringConstants.eMail,
  );

  Future<void> redictPrivacyWepPage() async {
    if (!await launchUrl(_url)) {
      throw Exception("Error: $_url");
    }
  }

  void redictEmailWepPage() {
    launchUrl(emailLaunchUri);
  }
}
