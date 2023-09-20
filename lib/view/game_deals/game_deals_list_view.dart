import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/provider/game_deals/game_deals_api_provider.dart';
import 'package:get_games/provider/game_deals/game_deals_price_provider.dart';
import 'package:get_games/provider/game_deals/game_deals_store_provider.dart';

final List<String> storeLabels = ["Steam", "Epic Games"];

class GameDealsListView extends ConsumerStatefulWidget {
  const GameDealsListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GameDealsListViewState();
}

class _GameDealsListViewState extends ConsumerState<GameDealsListView> {
  @override
  Widget build(BuildContext context) {
    final gameDealsData = ref.watch(gameDealsProvider);
    // final priceProvider = ref.watch(gameDealsPriceProvider);
    // final storeProvideri = ref.watch(storeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Deals"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Consumer(
                    builder: (context, ref, child) {
                      final selectedStore = ref.watch(storeApichProvider);

                      return SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                const Text("Select store"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                      value: selectedStore.selectedStoreLabel,
                                      onChanged: (value) {
                                        ref
                                            .read(storeApichProvider.notifier)
                                            .changeStore(value!);
                                      },
                                      items: storeLabels
                                          .map<DropdownMenuItem<String>>(
                                        (value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(
                                              value,
                                            ),
                                          );
                                        },
                                      ).toList()),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text("Select minimum price"),
                                Slider(
                                  max: 20.0,
                                  min: 0.1,
                                  divisions: 4,
                                  label:
                                      "\$ ${ref.watch(gameDealsPriceProvider).round().toString()}",
                                  value: ref.watch(gameDealsPriceProvider),
                                  onChanged: (value) {
                                    ref
                                        .read(gameDealsPriceProvider.notifier)
                                        .state = value;
                                  },
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
        ],
      ),
      body: gameDealsData.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final game = data[index];
              return ListTile(
                title: Text(game.title ?? "eee"),
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
