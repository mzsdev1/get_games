// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/ui/widgets/common/error_image.dart';

import '../../../localizations/locale_keys.g.dart';

class GameDealMainCardBody extends StatelessWidget {
  const GameDealMainCardBody({
    Key? key,
    required this.thumbUrl,
    required this.gameTitle,
    required this.gameSalePrice,
    required this.gameDealRate,
    required this.saving,
  }) : super(key: key);
  final String thumbUrl;
  final String gameTitle;
  final String gameSalePrice;
  final String gameDealRate;
  final String saving;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: 1.sw,
      child: Card(
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: thumbUrl,
              height: 45.h,
              width: 90.w,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const ErrorIcon(),
            ),
            SizedBox(
              width: 290.w,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gameTitle,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                    ),
                    Row(
                      children: [
                        Wrap(
                          spacing: 4.r,
                          children: [
                            Text(
                              LocaleKeys.commonTexts_priceText.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                            ),
                            Text(
                              "-$saving%",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 12.sp,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                            ),
                            Text(
                              "\$$gameSalePrice",
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text:
                                "${LocaleKeys.gameDealsView_scoreText.tr()}: ",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                            children: <TextSpan>[
                              TextSpan(
                                text: gameDealRate,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 12.sp,
                                    ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
