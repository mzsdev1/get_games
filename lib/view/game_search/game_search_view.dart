import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/provider/game_favorite/favorites_provider.dart';
import 'package:get_games/provider/game_search/game_search_api_provider.dart';

class GameSearchView extends ConsumerStatefulWidget {
  const GameSearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameSearchViewState();
}

class _GameSearchViewState extends ConsumerState<GameSearchView> {
  final controller = TextEditingController();

  //

//
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = ref.watch(favoriteGameIdsProvider);
    final searchGameProvider = ref.watch(gameSearchProvider);

//test

//t4st
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.back_hand),
          onPressed: () {
            //todo:
            //ref.read(isFirstRequestProvider.notifier).state = true;
            Navigator.pop(context);
          },
        ),
        title: SizedBox(
          width: double.infinity,
          child: Center(
            child: TextField(
              //maxLength: 40,
              controller: controller,
              onSubmitted: (_) {
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
              decoration: InputDecoration(
                hintText: "GTA",
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
          ),
        ),
      ),
      body: searchGameProvider.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final game = data[index];

              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(
                          game.thumb!,
                          width: 120,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          game.external!,
                          style: const TextStyle(overflow: TextOverflow.clip),
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
                  ],
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Text("Error: $error");
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
