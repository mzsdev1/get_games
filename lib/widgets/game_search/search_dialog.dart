import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/models/game_search_model.dart';
import 'package:get_games/providers/game_favorite/favorites_provider.dart';
import 'package:get_games/providers/game_search/dialog_button_provider.dart';

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
        final favoriteProvider = ref.watch(favoriteGameIdsProvider);
        final buttonEnableProvider = ref.watch(favButtonProvider);
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
                        "Cheapest:",
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
                          Navigator.pop(context);
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
                                    .read(favoriteGameIdsProvider.notifier)
                                    .toggle(game.gameID!, context);

                                ref.read(favButtonProvider.notifier).state =
                                    false;

                                Timer(
                                  const Duration(milliseconds: 500),
                                  () {
                                    ref.read(favButtonProvider.notifier).state =
                                        true;
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
                          // size: 26.r,
                          size: 26.r,
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
