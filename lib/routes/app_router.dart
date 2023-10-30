import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/dashboardView',
          page: DashboardRoute.page,
          initial: true,
          children: [
            AutoRoute(path: 'empty', page: EmptyRouter.page, children: [
              AutoRoute(
                path: 'freeGamesListView',
                page: FreeGamesListRoute.page,
              ),
              AutoRoute(
                path: 'gameDealsListView',
                page: GameDealsListRoute.page,
              ),
              AutoRoute(
                path: 'searchGameView',
                page: SearchGameRoute.page,
              ),
              AutoRoute(
                path: 'favoriteGamesView',
                page: FavoriteGamesRoute.page,
              ),
              AutoRoute(
                path: 'settingsView',
                page: SettingsRoute.page,
              ),
            ]),
          ],
        ),
        AutoRoute(
          path: '/freeGamesIndexView',
          page: FreeGamesIndexRoute.page,
        ),
        AutoRoute(
          path: '/gameDealsIndexView',
          page: GameDealsIndexRoute.page,
        ),
      ];
}

@RoutePage(name: 'EmptyRouter')
class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({super.key});
}

//todo
 