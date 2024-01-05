import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/data/models/game_deals_model.dart';
import '../../../localizations/locale_keys.g.dart';

class DealDateContainer extends StatelessWidget {
  const DealDateContainer({
    Key? key,
    required this.gameDeal,
  }) : super(key: key);
  final GameDealsModel gameDeal;

  @override
  Widget build(BuildContext context) {
    final releaseDate = gameDeal.releaseDate != null
        ? DateFormat('yyyy-MM-dd').format(gameDeal.releaseDate!)
        : "Unknown";
    final lastChange = gameDeal.lastChange != null
        ? DateFormat('yyyy-MM-dd').format(gameDeal.lastChange!)
        : "Unknown";

    return SizedBox(
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5).r,
              padding: const EdgeInsets.all(16).r,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(13).r,
                  bottomLeft: const Radius.circular(13).r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    LocaleKeys.gameDealsView_releaseDateText.tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    releaseDate,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5).r,
              padding: const EdgeInsets.all(16).r,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(13).r,
                  bottomRight: const Radius.circular(13).r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    LocaleKeys.gameDealsView_discountDateText.tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    lastChange,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14.sp,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
