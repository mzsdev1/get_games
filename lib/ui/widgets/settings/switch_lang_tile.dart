import 'package:dash_flags/dash_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchLangTile extends StatelessWidget {
  const SwitchLangTile({
    Key? key,
    required this.langText,
    required this.onTap,
    required this.locale,
    required this.language,
  }) : super(key: key);
  final String langText;
  final Function() onTap;
  final Locale locale;
  final Language language;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: LanguageFlag(
            language: language,
            height: 32.h,
          ),
          title: Text(
            langText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                ),
          ),
          trailing: context.locale == locale
              ? Icon(
                  Icons.check,
                  size: 24.w,
                )
              : null,
          onTap: onTap,
        ),
      ],
    );
  }
}
