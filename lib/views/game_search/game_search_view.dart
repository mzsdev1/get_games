import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/game_favorite/favorites_provider.dart';
import 'package:get_games/providers/game_search/game_search_api_provider.dart';
import 'package:get_games/widgets/common/load_progress_indicator.dart';
import 'package:get_games/widgets/game_search/search_text.dart';

class GameSearchView extends ConsumerStatefulWidget {
  const GameSearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameSearchViewState();
}

class _GameSearchViewState extends ConsumerState<GameSearchView> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = ref.watch(favoriteGameIdsProvider);
    final searchGameProvider = ref.watch(gameSearchProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //todo:
            //ref.read(isFirstRequestProvider.notifier).state = true;
            Navigator.pop(context);
          },
        ),
        //todo:
        title: TextField(
          controller: controller,
          onSubmitted: (_) {
            final ctrlText = controller.text.trim();
            bool isAlphaNumeric = RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(ctrlText);

            FocusScope.of(context).unfocus();

            if (ctrlText.isNotEmpty &&
                ctrlText.length <= 40 &&
                ctrlText.length >= 3 &&
                isAlphaNumeric) {
              ref.read(searchQueryProvider.notifier).state = controller.text;
            }

            controller.text = "";
          },
          decoration: InputDecoration(
            hintText: "Search game",
            suffixIcon: IconButton(
              onPressed: () {
                final ctrlText = controller.text.trim();
                bool isAlphaNumeric =
                    RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(ctrlText);

                FocusScope.of(context).unfocus();

                if (ctrlText.isNotEmpty &&
                    ctrlText.length <= 40 &&
                    ctrlText.length >= 3 &&
                    isAlphaNumeric) {
                  ref.read(searchQueryProvider.notifier).state =
                      controller.text;
                }

                controller.text = "";
              },
              icon: const Icon(Icons.search),
            ),
          ),
        ),
        //todo:
        //title: SearchPage(),
      ),
      body: searchGameProvider.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final game = data[index];

              return Container(
                child: Row(
                  children: [
                    CachedNetworkImage(
                      //height: 90,
                      imageUrl: game.thumb!,
                    ),
                    Column(
                      children: [
                        Text(
                          game.external!,
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        //dialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              child: SingleChildScrollView(
                                child: Hero(
                                  tag: SizedBox,
                                  child: SizedBox(
                                    height: 250,
                                    width: 300,
                                    child: Column(
                                      children: [
                                        Text(game.cheapest.toString()),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                        //dialog

                        ref
                            .read(favoriteGameIdsProvider.notifier)
                            .toggle(game.gameID!);
                      },
                      color: favoriteProvider.contains(game.gameID)
                          ? Colors.red
                          : Colors.grey,
                      icon: Icon(favoriteProvider.contains(game.gameID)
                          ? Icons.favorite
                          : Icons.favorite_border),
                    ),
                  ],
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Text("Error: $error");
        },
        loading: () => const LoadProgressIndicator(),
      ),
    );
  }
}
