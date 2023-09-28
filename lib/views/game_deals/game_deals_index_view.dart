import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/models/game_deals_model.dart';

class GameDealIndexView extends ConsumerWidget {
  const GameDealIndexView({super.key, required this.gameDeal});

  final GameDealsModel gameDeal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameDeal.title!),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Image.network(gameDeal.thumb!),
          ],
        )),
      ),
    );
  }
}
