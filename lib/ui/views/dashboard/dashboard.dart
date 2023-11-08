import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/providers/dashboard/nav_bar_provider.dart';
import 'package:get_games/ui/views/free_games/free_games_list_view.dart';
import 'package:get_games/ui/views/game_deals/game_deals_list_view.dart';
import 'package:get_games/ui/views/favorite_games/game_favorite_view.dart';
import 'package:get_games/ui/views/search_game/game_search_view.dart';
import 'package:get_games/ui/views/settings/settings_view.dart';
import 'package:get_games/ui/widgets/dashboard/bottom_items.dart';

const List<Widget> dashboardBody = [
  FreeGamesListView(),
  GameDealsListView(),
  SearchGameView(),
  FavoriteGamesView(),
  SettingsView(),
];

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarIndexProvider = ref.watch(navBarProvider);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 68.h,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: BottomItems().bottomNavItemList,
          currentIndex: navBarIndexProvider,
          onTap: (index) {
            ref.read(navBarProvider.notifier).state = index;
          },
        ),
      ),
      body: dashboardBody[navBarIndexProvider],
    );
  }
}
