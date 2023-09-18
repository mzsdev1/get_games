import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/view/free_games/free_games_view.dart';
import 'package:get_games/model/free_games_api_controller.dart';
import 'package:get_games/view/game_deals/game_deals_list_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
//TODO:
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndexProvider = ref.watch(navBarProvider);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.school_outlined),
            label: 'School',
          ),
        ],
        onDestinationSelected: (index) {
          ref.read(navBarProvider.notifier).state = index;
        },
        selectedIndex: navBarIndexProvider,
      ),
      body: <Widget>[
        const FreeGamesView(),
        const GameDealsListView(),
      ][navBarIndexProvider],
    );
  }
}
