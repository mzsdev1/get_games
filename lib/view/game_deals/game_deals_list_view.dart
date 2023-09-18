import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameDealsListView extends ConsumerStatefulWidget {
  const GameDealsListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GameDealsListViewState();
}

class _GameDealsListViewState extends ConsumerState<GameDealsListView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Game deals"),
    );
  }
}
