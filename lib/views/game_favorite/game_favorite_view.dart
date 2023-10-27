// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_games/providers/game_favorite/game_favorite_api_provider.dart';
// import 'package:get_games/providers/game_favorite/favorites_provider.dart';
// import 'package:get_games/widgets/common/appbar_title_text.dart';
// import 'package:get_games/widgets/common/empty_view.dart';
// import 'package:get_games/widgets/common/error_image.dart';
// import 'package:get_games/widgets/common/load_progress_indicator.dart';
// import 'package:get_games/widgets/game_favorite/delete_favorite_dialog.dart';
// import 'package:get_games/widgets/game_favorite/price_list_dialog.dart';

// class GameFavoriteView extends ConsumerStatefulWidget {
//   const GameFavoriteView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _GameFavoriteViewState();
// }

// class _GameFavoriteViewState extends ConsumerState<GameFavoriteView> {
//   @override
//   Widget build(BuildContext context) {
//     final favoriteProvider = ref.watch(gameFavoriteApiProvider);
//     final favIdsList = ref.watch(favoriteGameIdsProvider);

//     return Scaffold(
//       floatingActionButton: favIdsList.isNotEmpty
//           ? FloatingActionButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return const DeleteFavoriteDialog();
//                   },
//                 );
//               },
//               child: const Icon(
//                 Icons.delete,
//               ),
//             )
//           : null,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(54.5.h),
//         child: AppBar(
//           title: const AppBarTitleText(text: "Favorites"),
//         ),
//       ),
//       body: favoriteProvider.when(
//         data: (data) {
//           if (data.isNotEmpty) {
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 final game = data[index];
//                 final deals = game.deals;

//                 return Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 3, vertical: 0.5)
//                           .r,
//                   child: InkWell(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return FavoritePriceListDialog(deals: deals);
//                         },
//                       );
//                     },
//                     child: SizedBox(
//                       height: 50.w,
//                       width: 1.sw,
//                       child: Card(
//                         child: Row(
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10.0).r,
//                               child: CachedNetworkImage(
//                                 imageUrl: game.info!.thumb!,
//                                 width: 110.0.w,
//                                 height: 50.w,
//                                 fit: BoxFit.fill,
//                                 errorWidget: (context, url, error) =>
//                                     const ErrorIcon(),
//                               ),
//                             ),
//                             SizedBox(width: 11.w),
//                             SizedBox(
//                               width: 210.w,
//                               child: Text(
//                                 game.info!.title!,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleMedium!
//                                     .copyWith(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 13.sp,
//                                     ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return const EmptyView();
//           }
//         },
//         error: (error, stackTrace) {
//           return const EmptyView();
//         },
//         loading: () => const LoadProgressIndicator(),
//       ),
//     );
//   }
// }

//todo. 3
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/ads/ads_service.dart';
import 'package:get_games/providers/game_favorite/game_favorite_api_provider.dart';
import 'package:get_games/providers/game_favorite/favorites_provider.dart';
import 'package:get_games/widgets/common/appbar_title_text.dart';
import 'package:get_games/widgets/common/empty_view.dart';
import 'package:get_games/widgets/common/error_image.dart';
import 'package:get_games/widgets/common/load_progress_indicator.dart';
import 'package:get_games/widgets/game_favorite/delete_favorite_dialog.dart';
import 'package:get_games/widgets/game_favorite/price_list_dialog.dart';

class GameFavoriteView extends ConsumerStatefulWidget {
  const GameFavoriteView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GameFavoriteViewState();
}

class _GameFavoriteViewState extends ConsumerState<GameFavoriteView> {
  @override
  void initState() {
    super.initState();
    ref.read(googleAdServiceProvider).createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();
    ref.watch(googleAdServiceProvider).interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = ref.watch(gameFavoriteApiProvider);
    final favIdsList = ref.watch(favoriteGameIdsProvider);

    return Scaffold(
      floatingActionButton: favIdsList.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DeleteFavoriteDialog();
                  },
                );
              },
              child: const Icon(
                Icons.delete,
              ),
            )
          : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          title: const AppBarTitleText(text: "Favorites"),
        ),
      ),
      body: favoriteProvider.when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final game = data[index];
                final deals = game.deals;

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 0.5)
                          .r,
                  child: InkWell(
                    onTap: () {
                      ref.read(googleAdServiceProvider).showInterstitialAd();
                      //

                      showDialog(
                        context: context,
                        builder: (context) {
                          return FavoritePriceListDialog(deals: deals);
                        },
                      );
                    },
                    child: SizedBox(
                      height: 50.w,
                      width: 1.sw,
                      child: Card(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0).r,
                              child: CachedNetworkImage(
                                imageUrl: game.info!.thumb!,
                                width: 110.0.w,
                                height: 50.w,
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) =>
                                    const ErrorIcon(),
                              ),
                            ),
                            SizedBox(width: 11.w),
                            SizedBox(
                              width: 210.w,
                              child: Text(
                                game.info!.title!,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const EmptyView();
          }
        },
        error: (error, stackTrace) {
          return const EmptyView();
        },
        loading: () => const LoadProgressIndicator(),
      ),
    );
  }
}
