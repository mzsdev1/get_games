import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              child: const Icon(Icons.delete),
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

// class DeleteFavoriteDialog extends StatelessWidget {
//   const DeleteFavoriteDialog({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) => AlertDialog(
//         title: const Text("Remove All Games"),
//         content: const SingleChildScrollView(
//           child: ListBody(
//             children: [
//               Text("Are you sure to delete all favorite games?."),
//               Text("You can get back games you approve."),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () {
//               ref
//                   .read(favoriteGameIdsProvider.notifier)
//                   .deleteAllFavorites(context);

//               Navigator.pop(context);
//             },
//             child: const Text("Approve"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FavoritePriceListDialog extends StatelessWidget {
//   const FavoritePriceListDialog({
//     super.key,
//     required this.deals,
//   });

//   final List<Deals>? deals;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) => Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0).r,
//         ),
//         child: Container(
//           width: 250.w,
//           height: 200.h,
//           padding: const EdgeInsets.all(15.0).r,
//           child: Scrollbar(
//             thumbVisibility: true,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: deals!.length,
//               itemBuilder: (context, index) {
//                 final deal = deals![index];
//                 final storeName = ref
//                     .watch(storeNameProvider)
//                     .getStoreNameById(deal.storeID!);

//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Wrap(
//                       spacing: 3.w,
//                       children: [
//                         Text(
//                           "$storeName:",
//                           style:
//                               Theme.of(context).textTheme.titleMedium!.copyWith(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 13.sp,
//                                   ),
//                         ),
//                         Text(
//                           "\$${deal.price!}",
//                           style:
//                               Theme.of(context).textTheme.titleMedium!.copyWith(
//                                     fontSize: 13.sp,
//                                   ),
//                         ),
//                       ],
//                     ),
//                     Divider(
//                       color: Theme.of(context).dividerColor,
//                     ),
//                     const SizedBox(
//                       height: 8.0,
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


//


// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_games/providers/game_favorite/game_favorite_api_provider.dart';
// import 'package:get_games/providers/game_favorite/favorites_provider.dart';
// import 'package:get_games/providers/game_favorite/store_name_provider.dart';
// import 'package:get_games/views/game_search/game_search_view.dart';
// import 'package:get_games/widgets/common/error_image.dart';
// import 'package:get_games/widgets/common/load_progress_indicator.dart';

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
//                     return AlertDialog(
//                       title: const Text("Remove All Games"),
//                       content: const SingleChildScrollView(
//                         child: ListBody(
//                           children: [
//                             Text("Are you sure to delete all favorite games?."),
//                             Text("You can get back games you approve."),
//                           ],
//                         ),
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("Cancel"),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             ref
//                                 .read(favoriteGameIdsProvider.notifier)
//                                 .deleteAllFavorites(context);

//                             Navigator.pop(context);
//                           },
//                           child: const Text("Approve"),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: const Icon(Icons.delete),
//             )
//           : null,
//       appBar: AppBar(
//         title: const Text("Search Game"),
//         actions: [
//           IconButton(
//               onPressed: () => Navigator.of(context).push(
//                   MaterialPageRoute(builder: (_) => const GameSearchView())),
//               icon: const Icon(Icons.search))
//         ],
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
//                           return Dialog(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             child: Container(
//                               width: 250.w,
//                               height: 200.h,
//                               padding: const EdgeInsets.all(15.0).r,
//                               child: Scrollbar(
//                                 thumbVisibility: true,
//                                 child: ListView.builder(
//                                   shrinkWrap: true,
//                                   itemCount: deals!.length,
//                                   itemBuilder: (context, index) {
//                                     final deal = deals[index];
//                                     final storeName = ref
//                                         .watch(storeNameProvider)
//                                         .getStoreNameById(deal.storeID!);

//                                     return Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Wrap(
//                                           spacing: 3.w,
//                                           children: [
//                                             Text(
//                                               "$storeName:",
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .titleMedium!
//                                                   .copyWith(
//                                                     fontWeight: FontWeight.w600,
//                                                     fontSize: 13.sp,
//                                                   ),
//                                             ),
//                                             Text(
//                                               "\$${deal.price!}",
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .titleMedium!
//                                                   .copyWith(
//                                                     fontSize: 13.sp,
//                                                   ),
//                                             ),
//                                           ],
//                                         ),
//                                         Divider(
//                                           color: Theme.of(context).dividerColor,
//                                         ),
//                                         const SizedBox(
//                                           height: 8.0,
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           );
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
//                               borderRadius: BorderRadius.circular(13.0).r,
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
//                             Container(
//                               //color: Colors.amber,
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
//             return const Center(child: Text("No game found add more"));
//           }
//         },
//         error: (error, stackTrace) {
//           return Text("favoriteview: ${error.toString()}");
//         },
//         loading: () => const LoadProgressIndicator(),
//       ),
//     );
//   }
// }
