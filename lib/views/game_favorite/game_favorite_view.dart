import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/game_favorite/game_favorite_api_provider.dart';
import 'package:get_games/providers/game_favorite/favorites_provider.dart';
import 'package:get_games/providers/game_favorite/store_name_provider.dart';
import 'package:get_games/views/game_search/game_search_view.dart';
import 'package:get_games/widgets/common/load_progress_indicator.dart';
import 'package:get_games/widgets/game_search/search_text.dart';

class GameFavoriteView extends ConsumerStatefulWidget {
  const GameFavoriteView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GameFavoriteViewState();
}

class _GameFavoriteViewState extends ConsumerState<GameFavoriteView> {
  @override
  Widget build(BuildContext context) {
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
                                .deleteAllFavorites(context);

                            Navigator.pop(context);
                          },
                          child: const Text("Approve"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(Icons.delete),
            )
          : null,
      appBar: AppBar(
        title: const Text("Search Game"),
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

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              width:
                                  300, // Adjust the width to your desired size
                              height:
                                  250, // Adjust the height to your desired size
                              padding: EdgeInsets.all(16.0),
                              child: Scrollbar(
                                thumbVisibility:
                                    true, // Set this property to ensure the scrollbar is always shown
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: deals!.length,
                                  itemBuilder: (context, index) {
                                    final deal = deals[index];
                                    final storeName = ref
                                        .watch(storeNameProvider)
                                        .getStoreNameById(deal.storeID!);

                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              storeName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1,
                                            ),
                                            Text(
                                              deal.price!,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.0),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );

                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return Dialog(
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //       ),
                      //       child: Container(
                      //         width: 300,
                      //         height: 250,
                      //         padding: const EdgeInsets.all(16.0),
                      //         child: ListView.builder(
                      //           itemCount: deals!.length,
                      //           itemBuilder: (context, index) {
                      //             final deal = deals[index];
                      //             final storeName = ref
                      //                 .watch(storeNameProvider)
                      //                 .getStoreNameById(deal.storeID!);

                      //             return Column(
                      //               children: [
                      //                 Row(
                      //                   children: [
                      //                     Text(
                      //                       storeName,
                      //                       style: Theme.of(context)
                      //                           .textTheme
                      //                           .subtitle1,
                      //                     ),
                      //                     Text(
                      //                       deal.price!,
                      //                       style: TextStyle(
                      //                         fontWeight: FontWeight.bold,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 SizedBox(height: 8.0),
                      //               ],
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // );
                      //todo
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return SizedBox(
                      //       height: 350,
                      //       width: 550,
                      //       child: Dialog(
                      //         child: ListView.builder(
                      //           itemCount: deals!.length,
                      //           itemBuilder: (context, index) {
                      //             final deal = deals[index];
                      //             final storeName = ref
                      //                 .watch(storeNameProvider)
                      //                 .getStoreNameById(deal.storeID!);

                      //             return Column(
                      //               children: [
                      //                 Row(
                      //                   children: [
                      //                     Text(
                      //                       storeName,
                      //                       style: Theme.of(context)
                      //                           .textTheme
                      //                           .labelMedium,
                      //                     ),
                      //                     Text(deal.price!),
                      //                   ],
                      //                 ),
                      //               ],
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // );
                    },
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Card(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                imageUrl: game.info!.thumb!,
                                width: 110.0,
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Container(
                              width: 222,
                              child: Text(
                                game.info!.title!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
        loading: () => const LoadProgressIndicator(),
      ),
    );
  }
}
