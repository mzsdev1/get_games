import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/model/free_games_api_controller.dart';

class FreeGamesView extends ConsumerWidget {
  const FreeGamesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final freeGamesData = ref.watch(freeGamesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Free Games"),
      ),
      body: freeGamesData.when(
        error: (error, stackTrace) {
          return Center(
            child: Text(
              "Something went wrong: ${error.toString()}", //TODO:
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()), //TODO:
        data: (data) {
          if (data.isEmpty) {
            //TODO:
          }
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
      ),
    );
  }
}
