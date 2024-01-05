import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/data/models/free_games_model.dart';
import 'package:get_games/ui/widgets/common/error_image.dart';
import 'package:get_games/ui/widgets/common/full_container.dart';
import 'package:get_games/ui/widgets/common/get_button.dart';
import 'package:get_games/ui/widgets/common/half_container.dart';
import 'package:get_games/ui/widgets/free_games/column_text.dart';
import 'package:get_games/ui/widgets/free_games/date_container.dart';

class FreeGamesDetailView extends StatelessWidget {
  const FreeGamesDetailView({super.key, required this.freeGame});

  final FreeGamesModel freeGame;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.freeGamesView_freeText.tr(),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18,
              ),
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.r,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: freeGame.image!,
              width: 1.sw,
              height: 225.h,
              errorWidget: (context, url, error) => const ErrorIcon(),
            ),
            Padding(
              padding: REdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      freeGame.title!,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      HalfContainer(
                          header: LocaleKeys.commonTexts_priceText.tr(),
                          info: freeGame.worth!),
                      SizedBox(width: 30.w),
                      HalfContainer(
                          header: LocaleKeys.commonTexts_typeText.tr(),
                          info: freeGame.type!),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  FullContainer(
                      header: LocaleKeys.freeGamesView_platformsText.tr(),
                      info: freeGame.platforms),
                  SizedBox(height: 7.h),
                  ColumnText(
                      title: LocaleKeys.freeGamesView_descriptionText.tr(),
                      data: freeGame.description!),
                  SizedBox(height: 7.h),
                  DateContainer(
                      header: LocaleKeys.freeGamesView_endDateText.tr(),
                      freeGame: freeGame),
                  SizedBox(height: 7.h),
                  ColumnText(
                    title: LocaleKeys.freeGamesView_instructionsText.tr(),
                    data: freeGame.instructions!,
                  ),
                  SizedBox(height: 15.h),
                  Center(
                    child: GetButton(
                      buttonText: LocaleKeys.commonTexts_getButtonText.tr(),
                      urlString: freeGame.openGiveawayUrl ?? "",
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
