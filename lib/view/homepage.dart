import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/view/free_games/free_games_view.dart';
import 'package:get_games/provider/free_games/free_games_api_controller.dart';
import 'package:get_games/view/game_deals/game_deals_list_view.dart';
import 'package:get_games/view/game_search/game_search_view.dart';

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
            selectedIcon: Icon(Icons.redeem),
            icon: Icon(Icons.redeem_outlined),
            label: 'Game',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.discount),
            icon: Icon(Icons.discount_outlined),
            label: 'Deals',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_off_outlined),
            label: 'Deals',
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
        const GameSearchView(),
      ][navBarIndexProvider],
    );
  }
}
