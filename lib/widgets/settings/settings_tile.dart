import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.subTitle,
    required this.title,
    required this.leadingIcon,
    required this.trailing,
  }) : super(key: key);
  final String subTitle;
  final String title;
  final IconData leadingIcon;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                // fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 12.sp,
              ),
        ),
        ListTile(
          leading: Icon(
            leadingIcon,
            size: 24.w,
          ),
          title: Text(
            subTitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  //letterSpacing: 1.w,
                ),
          ),
          trailing: trailing,
          // onTap: onTap,
        ),
      ],
    );
  }
}
