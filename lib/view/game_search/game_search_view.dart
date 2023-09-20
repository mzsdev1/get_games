import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/provider/game_search/game_search_api_provider.dart';

class GameSearchView extends ConsumerStatefulWidget {
  const GameSearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameSearchViewState();
}

class _GameSearchViewState extends ConsumerState<GameSearchView> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    //final queryProvider = ref.watch(searchQueryProvider);
    final searchGameProvider = ref.watch(gameSearchProvider);
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: double.infinity,
          child: Center(
            child: TextField(
              //maxLength: 40,
              controller: controller,
              onSubmitted: (_) {
                final ctrlText = controller.text;
                bool isAlphaNumeric =
                    RegExp(r'^[a-zA-Z0-9]+$').hasMatch(ctrlText);

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
                    final ctrlText = controller.text;
                    bool isAlphaNumeric =
                        RegExp(r'^[a-zA-Z0-9]+$').hasMatch(ctrlText);

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
                child: Text(game.external!),
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
