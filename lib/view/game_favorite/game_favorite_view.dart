import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/provider/game_favorite/game_favorite_api_provider.dart';
import 'package:get_games/provider/game_favorite/favorites_provider.dart';
import 'package:get_games/view/game_search/game_search_view.dart';

class GameFavoriteView extends ConsumerStatefulWidget {
  const GameFavoriteView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GameFavoriteViewState();
}

class _GameFavoriteViewState extends ConsumerState<GameFavoriteView> {
  @override
  Widget build(BuildContext context) {
    //todo:1000
    final favoriteProvider = ref.watch(gameFavoriteApiProvider);
    final favIdsList = ref.watch(favoriteGameIdsProvider);
    return Scaffold(
      floatingActionButton: favIdsList.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
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
                                .deleteAllFavorites();

                            Navigator.pop(context);
                          },
                          child: const Text("Approve"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(Icons.delete_forever))
          : null,
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const GameSearchView())),
              icon: const Icon(Icons.search))
        ],
      ),
      body: favoriteProvider.when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final game = data[index];
                final deals = game.deals;

                // final deals = game.deals[index];

                // Eğer indeks geçerli ise, deals'dan ilgili deal'i alın
                //final deal = index < deals.length ? deals[index] : null;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: SizedBox(
                                      height: 500,
                                      width: 300,
                                      child: ListView.builder(
                                        itemCount: deals!.length,
                                        itemBuilder: (context, index) {
                                          final deal = deals[index];
                                          return Text(deal.price!);
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Image.network(game.info!.thumb!),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    (game.info!.title! +
                                        game.cheapestPriceEver!.price
                                            .toString()),
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No game found add more"));
          }
        },
        error: (error, stackTrace) {
          return Text("favoriteview: ${error.toString()}");
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
