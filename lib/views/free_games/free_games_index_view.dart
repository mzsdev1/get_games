import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/models/free_games_model.dart';

class GameFreeIndexView extends ConsumerWidget {
  const GameFreeIndexView({super.key, required this.freeGame});

  final FreeGamesModel freeGame;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(freeGame.title),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Image.network(freeGame.image),
          ],
        )),
      ),
    );
  }
}
