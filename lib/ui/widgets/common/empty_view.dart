import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/empty.png",
            width: 115.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            LocaleKeys.emptyView_noGameFoundText.tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: Theme.of(context).colorScheme.primary,
                  wordSpacing: 1.r,
                ),
          ),
          SizedBox(
            height: 70.h,
          ),
        ],
      ),
    );
  }
}
