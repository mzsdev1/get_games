import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.subTitle,
    required this.title,
    required this.leadingIcon,
    this.trailing,
    this.onTap,
  }) : super(key: key);
  final String subTitle;
  final String title;
  final IconData leadingIcon;
  final Widget? trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 3.w,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontSize: 11.sp,
                  ),
            ),
          ],
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
                ),
          ),
          trailing: trailing,
          onTap: onTap,
        ),
      ],
    );
  }
}
