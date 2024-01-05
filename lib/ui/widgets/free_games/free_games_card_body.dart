import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/ui/widgets/common/error_image.dart';
import 'package:get_games/ui/widgets/free_games/custom_rich_text.dart';

class FreeGamesCardBody extends StatelessWidget {
  final String imagePath;
  final String title;
  final String platforms;
  final String price;

  const FreeGamesCardBody({
    super.key,
    required this.imagePath,
    required this.title,
    required this.platforms,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: 1.sw,
            height: 146.h,
            imageUrl: imagePath,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const ErrorIcon(),
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                    ),
                  ),
                  SizedBox(height: 3.5.h),
                  CustomRichText(
                    title: "${LocaleKeys.freeGamesView_platformsText.tr()}: ",
                    data: platforms,
                  ),
                  SizedBox(height: 3.5.h),
                  CustomRichText(
                      title: "${LocaleKeys.commonTexts_priceText.tr()}: ",
                      data: price),
                  SizedBox(height: 3.5.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
