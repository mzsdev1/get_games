import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/providers/game_favorite/favorites_provider.dart';

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
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                LocaleKeys.favoriteGamesView_alertDialog_sureDeleteAllText.tr(),
              ),
              Text(
                LocaleKeys.favoriteGamesView_alertDialog_undoneText.tr(),
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
            ),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(favoriteGameIdsProvider.notifier)
                  .deleteAllFavorites(context);

              Navigator.of(context).pop();
            },
            child: Text(
              LocaleKeys.favoriteGamesView_alertDialog_approveText.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
