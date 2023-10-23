import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/views/free_games/free_games_view.dart';
import 'package:get_games/providers/free_games/free_games_api_controller.dart';
import 'package:get_games/views/game_deals/game_deals_list_view.dart';
import 'package:get_games/views/game_favorite/game_favorite_view.dart';
import 'package:get_games/views/game_search/game_search_view.dart';
import 'package:get_games/views/settings/settings_view.dart';
import 'package:get_games/widgets/common/nav_destination_icon.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndexProvider = ref.watch(navBarProvider);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 67.h,
        destinations: const [
          NavDestinationIcon(
              title: "Free",
              selectedIcon: Icons.redeem,
              unselectedIcon: Icons.redeem_outlined),
          NavDestinationIcon(
              title: "Deals",
              selectedIcon: Icons.discount,
              unselectedIcon: Icons.discount_outlined),
          NavDestinationIcon(
              title: "Search",
              selectedIcon: Icons.search,
              unselectedIcon: Icons.search_outlined),
          NavDestinationIcon(
              title: "Favorites",
              selectedIcon: Icons.favorite,
              unselectedIcon: Icons.favorite_border),
          NavDestinationIcon(
              title: "Settings",
              selectedIcon: Icons.settings,
              unselectedIcon: Icons.settings_outlined),
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
