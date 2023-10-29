// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/models/game_deals_model.dart';
import 'package:get_games/providers/game_deals/game_deals_store_provider.dart';
import 'package:get_games/providers/game_favorite/favorites_provider.dart';
import 'package:get_games/providers/game_search/dialog_button_provider.dart';
import 'package:get_games/widgets/common/deal_date_container.dart';
import 'package:get_games/widgets/common/error_image.dart';
import 'package:get_games/widgets/common/full_container.dart';
import 'package:get_games/widgets/common/get_button.dart';
import 'package:get_games/widgets/common/half_container.dart';
import 'package:get_games/widgets/game_deals/rate_container.dart';
import 'package:auto_route/auto_route.dart';

//todo route :

@RoutePage()
class GameDealsIndexView extends ConsumerWidget {
  const GameDealsIndexView({super.key, required this.gameDeal});

  final GameDealsModel gameDeal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeNum = ref.watch(storeNameProvider);
    //todo
    final favoriteProvider = ref.watch(favoriteGameIdsProvider);
    final buttonEnableProvider = ref.watch(favButtonProvider);
    //todo:

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discounted",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
              ),
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 24.r,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: REdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    gameDeal.title!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                  ),
                ),
                SizedBox(height: 7.h),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(13).r),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        height: 47.h,
                        width: 138.w,
                        imageUrl: gameDeal.thumb!,
                        errorWidget: (context, url, error) => const ErrorIcon(),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5).r,
                        padding: const EdgeInsets.symmetric(horizontal: 16).r,
                        height: 47.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(13).r,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.25),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "\$${gameDeal.normalPrice!}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    color: Theme.of(context).hintColor,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            Container(
                              height: 35.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(8).r),
                              child: Center(
                                child: Text(
                                  "-${gameDeal.savings!}%",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 14.sp,
                                      ),
                                ),
                              ),
                            ),
                            Text(
                              "\$${gameDeal.salePrice!}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 14.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //todo:
                SizedBox(height: 7.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5).r,
                        padding: const EdgeInsets.symmetric(horizontal: 16).r,
                        height: 47.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(13).r,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.25),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add Favorite",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            IconButton.filledTonal(
                              onPressed: buttonEnableProvider
                                  ? () {
                                      ref
                                          .read(
                                              favoriteGameIdsProvider.notifier)
                                          .toggle(gameDeal.gameId!, context);

                                      ref
                                          .read(favButtonProvider.notifier)
                                          .state = false;

                                      Timer(
                                        const Duration(milliseconds: 500),
                                        () {
                                          ref
                                              .read(favButtonProvider.notifier)
                                              .state = true;
                                        },
                                      );
                                    }
                                  : null,
                              color: favoriteProvider.contains(gameDeal.gameId)
                                  ? Theme.of(context).indicatorColor
                                  : Theme.of(context).unselectedWidgetColor,
                              icon: Icon(
                                favoriteProvider.contains(gameDeal.gameId)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 24.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //todo:
                SizedBox(height: 7.h),
                FullContainer(
                  header: "Platform",
                  info: storeNum.selectedApiNumber == 1
                      ? "Steam"
                      : "Epic Games Store",
                ),
                SizedBox(height: 7.h),
                Row(
                  children: [
                    HalfContainer(
                        header: "Reviews", info: gameDeal.steamRatingCount!),
                    SizedBox(width: 26.w),
                    const HalfContainer(header: "Type", info: "Game"),
                  ],
                ),
                SizedBox(height: 7.h),
                Row(
                  children: [
                    RateContainer(
                      rateTitle: "Score",
                      infoWidget: Container(
                        alignment: Alignment.center,
                        height: 36.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Text(
                          gameDeal.dealRating ?? "0",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                        ),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    RateContainer(
                      rateTitle: "Metacritic",
                      infoWidget: Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: 36.h,
                          width: 38.w,
                          color: Theme.of(context).colorScheme.primaryContainer,
                          child: Text(
                            gameDeal.metacriticScore ?? "0",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14.sp,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                    ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 9.w),
                    RateContainer(
                      rateTitle: "Rate",
                      infoWidget: Container(
                        alignment: Alignment.center,
                        height: 36.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(8).r,
                            bottomRight: const Radius.circular(8).r,
                          ),
                        ),
                        child: Text(
                          "%${gameDeal.steamRatingPercent}",
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7.h,
                ),
                FullContainer(
                  header: "Average Review",
                  info: gameDeal.steamRatingText,
                ),
                SizedBox(
                  height: 7.h,
                ),
                DealDateContainer(
                  gameDeal: gameDeal,
                ),
                SizedBox(
                  height: 15.h,
                ),
                GetButton(
                  //todo:
                  buttonText: "Get",
                  urlString:
                      "https://www.cheapshark.com/redirect?dealID=${gameDeal.dealID}",
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
