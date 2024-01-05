import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/providers/favorite_games/favorite_games_id_provider.dart';

class DeleteFavoriteDialog extends StatelessWidget {
  const DeleteFavoriteDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => AlertDialog(
        title: Text(
          LocaleKeys.favoriteGamesView_alertDialog_clearFavListText.tr(),
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 20.sp,
              ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                LocaleKeys.favoriteGamesView_alertDialog_sureDeleteAllText.tr(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
              Text(
                LocaleKeys.favoriteGamesView_alertDialog_undoneText.tr(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              LocaleKeys.favoriteGamesView_alertDialog_cancelText.tr(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(favoriteGamesIdProvider.notifier)
                  .deleteAllFavorites(context);

              Navigator.of(context).pop();
            },
            child: Text(
              LocaleKeys.favoriteGamesView_alertDialog_approveText.tr(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
