// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:get_games/models/free_games_model.dart' as _i11;
import 'package:get_games/models/game_deals_model.dart' as _i12;
import 'package:get_games/views/dashboard/dashboard.dart' as _i1;
import 'package:get_games/views/favorite_games/game_favorite_view.dart' as _i2;
import 'package:get_games/views/free_games/free_games_index_view.dart' as _i3;
import 'package:get_games/views/free_games/free_games_list_view.dart' as _i4;
import 'package:get_games/views/game_deals/game_deals_index_view.dart' as _i5;
import 'package:get_games/views/game_deals/game_deals_list_view.dart' as _i6;
import 'package:get_games/views/search_game/game_search_view.dart' as _i7;
import 'package:get_games/views/settings/settings_view.dart' as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardView(),
      );
    },
    FavoriteGamesRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavoriteGamesView(),
      );
    },
    FreeGamesIndexRoute.name: (routeData) {
      final args = routeData.argsAs<FreeGamesIndexRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.FreeGamesIndexView(
          key: args.key,
          freeGame: args.freeGame,
        ),
      );
    },
    FreeGamesListRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.FreeGamesListView(),
      );
    },
    GameDealsIndexRoute.name: (routeData) {
      final args = routeData.argsAs<GameDealsIndexRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.GameDealsIndexView(
          key: args.key,
          gameDeal: args.gameDeal,
        ),
      );
    },
    GameDealsListRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.GameDealsListView(),
      );
    },
    SearchGameRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SearchGameView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SettingsView(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardView]
class DashboardRoute extends _i9.PageRouteInfo<void> {
  const DashboardRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavoriteGamesView]
class FavoriteGamesRoute extends _i9.PageRouteInfo<void> {
  const FavoriteGamesRoute({List<_i9.PageRouteInfo>? children})
      : super(
          FavoriteGamesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteGamesRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FreeGamesIndexView]
class FreeGamesIndexRoute extends _i9.PageRouteInfo<FreeGamesIndexRouteArgs> {
  FreeGamesIndexRoute({
    _i10.Key? key,
    required _i11.FreeGamesModel freeGame,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          FreeGamesIndexRoute.name,
          args: FreeGamesIndexRouteArgs(
            key: key,
            freeGame: freeGame,
          ),
          initialChildren: children,
        );

  static const String name = 'FreeGamesIndexRoute';

  static const _i9.PageInfo<FreeGamesIndexRouteArgs> page =
      _i9.PageInfo<FreeGamesIndexRouteArgs>(name);
}

class FreeGamesIndexRouteArgs {
  const FreeGamesIndexRouteArgs({
    this.key,
    required this.freeGame,
  });

  final _i10.Key? key;

  final _i11.FreeGamesModel freeGame;

  @override
  String toString() {
    return 'FreeGamesIndexRouteArgs{key: $key, freeGame: $freeGame}';
  }
}

/// generated route for
/// [_i4.FreeGamesListView]
class FreeGamesListRoute extends _i9.PageRouteInfo<void> {
  const FreeGamesListRoute({List<_i9.PageRouteInfo>? children})
      : super(
          FreeGamesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FreeGamesListRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.GameDealsIndexView]
class GameDealsIndexRoute extends _i9.PageRouteInfo<GameDealsIndexRouteArgs> {
  GameDealsIndexRoute({
    _i10.Key? key,
    required _i12.GameDealsModel gameDeal,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          GameDealsIndexRoute.name,
          args: GameDealsIndexRouteArgs(
            key: key,
            gameDeal: gameDeal,
          ),
          initialChildren: children,
        );

  static const String name = 'GameDealsIndexRoute';

  static const _i9.PageInfo<GameDealsIndexRouteArgs> page =
      _i9.PageInfo<GameDealsIndexRouteArgs>(name);
}

class GameDealsIndexRouteArgs {
  const GameDealsIndexRouteArgs({
    this.key,
    required this.gameDeal,
  });

  final _i10.Key? key;

  final _i12.GameDealsModel gameDeal;

  @override
  String toString() {
    return 'GameDealsIndexRouteArgs{key: $key, gameDeal: $gameDeal}';
  }
}

/// generated route for
/// [_i6.GameDealsListView]
class GameDealsListRoute extends _i9.PageRouteInfo<void> {
  const GameDealsListRoute({List<_i9.PageRouteInfo>? children})
      : super(
          GameDealsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameDealsListRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SearchGameView]
class SearchGameRoute extends _i9.PageRouteInfo<void> {
  const SearchGameRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SearchGameRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchGameRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SettingsView]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
