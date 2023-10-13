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
        title: const Text("Remove All Games"),
        content: const SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Are you sure to delete all favorite games?."),
              Text("You can get back games you approve."),
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
            child: const Text("Approve"),
          ),
        ],
      ),
    );
  }
}
