// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class GetButton extends StatelessWidget {
  const GetButton({
    Key? key,
    this.buttonText,
    required this.urlString,
  }) : super(key: key);

  final String? buttonText;

  final String urlString;

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(urlString);

    Future<void> canLaunchUrl() async {
      if (!await launchUrl(url)) {
        throw Exception("Error: $url");
      }
    }

    return SizedBox(
      width: 200.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
          elevation: 4,
        ),
        onPressed: canLaunchUrl,
        child: Text(
          buttonText!,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14.sp,
              ),
        ),
      ),
    );
  }
}
