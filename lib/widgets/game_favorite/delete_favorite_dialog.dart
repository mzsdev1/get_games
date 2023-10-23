import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/game_favorite/favorites_provider.dart';

class DeleteFavoriteDialog extends StatelessWidget {
  const DeleteFavoriteDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => AlertDialog(
        title: const Text(
          "Clear Favorite List",
        ),
        content: const SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                "Are you sure you want to delete all games on the favorite page?",
              ),
              Text(
                "This action cannot be undone.",
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(favoriteGameIdsProvider.notifier)
                  .deleteAllFavorites(context);

              Navigator.pop(context);
            },
            child: const Text(
              "Approve",
            ),
          ),
        ],
      ),
    );
  }
}
