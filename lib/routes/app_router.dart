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

// import 'package:auto_route/auto_route.dart';
// import 'app_router.gr.dart';

// @AutoRouterConfig()
// class AppRouter extends $AppRouter {
//   @override
//   List<AutoRoute> get routes => [
//         AutoRoute(
//           path: '/dashboardView',
//           page: DashboardView.page,
//           initial: true,
//           children: [
//             AutoRoute(
//               path: 'freeGamesListView',
//               page: FreeGamesListView.page,
//             ),
//             AutoRoute(
//               path: 'gameDealsListView',
//               page: GameDealsListView.page,
//             ),
//             AutoRoute(
//               path: 'searchGameView',
//               page: SearchGameView.page,
//             ),
//             AutoRoute(
//               path: 'favoriteGamesView',
//               page: FavoriteGamesView.page,
//             ),
//             AutoRoute(
//               path: 'settingsView',
//               page: SettingsView.page,
//             ),
//           ],
//         ),
//         AutoRoute(
//           path: '/freeGamesIndexView',
//           page: FreeGamesIndexView.page,
//         ),
//         AutoRoute(
//           path: '/gameDealsIndexView',
//           page: GameDealsIndexView.page,
//         ),
//       ];
// }
