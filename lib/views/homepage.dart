import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/views/free_games/free_games_view.dart';
import 'package:get_games/providers/free_games/free_games_api_controller.dart';
import 'package:get_games/views/game_deals/game_deals_list_view.dart';
import 'package:get_games/views/game_favorite/game_favorite_view.dart';
import 'package:get_games/views/game_search/game_search_view.dart';
import 'package:get_games/views/settings/settings_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
//TODO:
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndexProvider = ref.watch(navBarProvider);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 65.h,
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
            selectedIcon: Icon(
              Icons.search,
            ),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
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
        const GameFavoriteView(),
        const SettingsView(),
        //const GameSearchView(),
      ][navBarIndexProvider],
    );
  }
}
