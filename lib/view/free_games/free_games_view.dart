import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/provider/free_games/free_games_api_controller.dart';

final filters = [
  'epic-games-store',
  'steam',
  'gog',
  "itchio",
  "ubisoft",
  "origin",
  "drm-free",
];

final List<String> gameTypes = ["game", "loot"];

class FreeGamesView extends ConsumerStatefulWidget {
  const FreeGamesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FreeGamesViewState();
}

class _FreeGamesViewState extends ConsumerState<FreeGamesView> {
  @override
  Widget build(BuildContext context) {
    final freeGamesData = ref.watch(freeGamesProvider);
    //final selectedFilters = ref.watch(selectedFiltersProvider);
//test TODO:
    //final selectedGameType = ref.watch(selectedGameTypeProvider);
//test TODO:
    return Scaffold(
      appBar: AppBar(
        title: const Text("Free Games"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Consumer(
                    builder: (context, ref, child) {
                      return SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Select type",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                      value:
                                          ref.watch(selectedGameTypeProvider),
                                      onChanged: (value) {
                                        ref
                                            .read(selectedGameTypeProvider
                                                .notifier)
                                            .setSelectedGameType(value!);
                                      },
                                      items: gameTypes
                                          .map<DropdownMenuItem<String>>(
                                        (value) {
                                          return DropdownMenuItem(
                                              value: value,
                                              child: Text(value.toUpperCase()));
                                        },
                                      ).toList()),
                                ),
                              ],
                            ),
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Select game filter",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Wrap(
                                  children: filters.map((filter) {
                                    final isSelected = ref
                                        .watch(selectedFiltersProvider)
                                        .contains(filter);

                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FilterChip(
                                        label: Text(
                                          filter
                                              .replaceAll("-", " ")
                                              .toUpperCase(),
                                        ),
                                        selected: isSelected,
                                        onSelected: (_) {
                                          ref
                                              .read(selectedFiltersProvider
                                                  .notifier)
                                              .toggleFilter(filter);
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            icon: const Icon(Icons.filter_alt),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: freeGamesData.when(
        data: (data) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final game = data[index];

              return Card(
                child: Column(
                  children: [
                    Text(game.title),
                  ],
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text(
              // "Something went wrong: ${error.toString()}", //TODO:
              // style: const TextStyle(color: Colors.red),
              "No active giveaways available at the moment, please try again later",
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()), //TODO:
      ),
    );
  }
}
