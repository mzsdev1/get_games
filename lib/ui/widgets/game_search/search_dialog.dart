import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/data/models/game_search_model.dart';
import 'package:get_games/providers/favorite_games/favorite_games_id_provider.dart';
import 'package:get_games/providers/game_search/dialog_fav_button_provider.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({
    super.key,
    required this.game,
  });

  final GameSearchModel game;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final favoriteProvider = ref.watch(favoriteGamesIdProvider);
        final buttonEnableProvider = ref.watch(dialogFavButtonProvider);
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0).r),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 2.h),
                  Text(
                    game.external!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                  ),
                  Wrap(
                    spacing: 4.w,
                    children: [
                      Text(
                        LocaleKeys.searchGameView_cheapestText.tr(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                      ),
                      Text(
                        "\$${game.cheapest!}",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          size: 26.r,
                        ),
                      ),
                      SizedBox(width: 40.w),
                      IconButton.filledTonal(
                        onPressed: buttonEnableProvider
                            ? () {
                                ref
                                    .read(favoriteGamesIdProvider.notifier)
                                    .toggle(game.gameID!, context);

                                ref
                                    .read(dialogFavButtonProvider.notifier)
                                    .state = false;

                                Timer(
                                  const Duration(milliseconds: 250),
                                  () {
                                    ref
                                        .read(dialogFavButtonProvider.notifier)
                                        .state = true;
                                  },
                                );
                              }
                            : null,
                        color: favoriteProvider.contains(game.gameID)
                            ? Theme.of(context).indicatorColor
                            : Theme.of(context).unselectedWidgetColor,
                        icon: Icon(
                          favoriteProvider.contains(game.gameID)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 24.r,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
