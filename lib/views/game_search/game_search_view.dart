import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/providers/game_search/game_search_api_provider.dart';
import 'package:get_games/widgets/common/error_image.dart';
import 'package:get_games/widgets/common/load_progress_indicator.dart';
import 'package:get_games/widgets/game_search/search_dialog.dart';

class GameSearchView extends ConsumerStatefulWidget {
  const GameSearchView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameSearchViewState();
}

class _GameSearchViewState extends ConsumerState<GameSearchView> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchGameProvider = ref.watch(gameSearchProvider);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //title: const GameSearchBar(),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TextField(
            controller: controller,
            onSubmitted: (_) {
              final ctrlText = controller.text.trim();
              bool isAlphaNumeric =
                  RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(ctrlText);

              FocusScope.of(context).unfocus();

              if (ctrlText.isNotEmpty &&
                  ctrlText.length <= 40 &&
                  ctrlText.length >= 3 &&
                  isAlphaNumeric) {
                ref.read(searchQueryProvider.notifier).state = controller.text;
              }

              controller.text = "";
            },
            decoration: const InputDecoration(
              hintText: 'Search game...',
              prefixIcon: Icon(
                Icons.search,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
        ),
      ),
      body: searchGameProvider.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final game = data[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2).r,
                child: ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SearchDialog(game: game);
                      },
                    );
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0).r,
                    child: CachedNetworkImage(
                      imageUrl: game.thumb!,
                      width: 90.w,
                      height: 30.h,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => const ErrorIcon(),
                    ),
                  ),
                  title: Text(
                    game.external!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 13.sp),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Text("Error: $error");
        },
        loading: () => const LoadProgressIndicator(),
      ),
    );
  }
}

// class FavoriteDialog extends StatelessWidget {
//   const FavoriteDialog({
//     super.key,
//     required this.game,
//   });

//   final GameSearchModel game;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) {
//         final favoriteProvider = ref.watch(favoriteGameIdsProvider);
//         return Dialog(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(13.0).r),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0).r,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 2.h),
//                   Text(
//                     game.external!,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.sp,
//                         ),
//                   ),
//                   Wrap(
//                     spacing: 4.w,
//                     children: [
//                       Text(
//                         "Cheapest:",
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 12.sp,
//                             ),
//                       ),
//                       Text(
//                         "\$${game.cheapest!}",
//                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                               fontSize: 12.sp,
//                             ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10.h),
//                   Center(
//                     child: IconButton.filledTonal(
//                       onPressed: () {
//                         ref
//                             .read(favoriteGameIdsProvider.notifier)
//                             .toggle(game.gameID!, context);

//                         Timer(const Duration(milliseconds: 650), () {
//                           Navigator.of(context).pop();
//                         });
//                       },
//                       color: favoriteProvider.contains(game.gameID)
//                           ? Colors.red
//                           : Theme.of(context).unselectedWidgetColor,
//                       icon: Icon(
//                         favoriteProvider.contains(game.gameID)
//                             ? Icons.favorite
//                             : Icons.favorite_border,
//                         size: 30.r,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 2.h),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

 







//yedek 

// import 'dart:async';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_games/providers/game_favorite/favorites_provider.dart';
// import 'package:get_games/providers/game_search/game_search_api_provider.dart';
// import 'package:get_games/widgets/common/error_image.dart';
// import 'package:get_games/widgets/common/load_progress_indicator.dart';
// import 'package:get_games/widgets/game_search/search_text.dart';

// class GameSearchView extends ConsumerStatefulWidget {
//   const GameSearchView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _GameSearchViewState();
// }

// class _GameSearchViewState extends ConsumerState<GameSearchView> {
//   final controller = TextEditingController();

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final searchGameProvider = ref.watch(gameSearchProvider);

//     return Scaffold(
//       appBar: AppBar(
//         surfaceTintColor: Colors.transparent,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         //title: const GameSearchBar(),
//         title: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25.0),
//           ),
//           child: TextField(
//             controller: controller,
//             onSubmitted: (_) {
//               final ctrlText = controller.text.trim();
//               bool isAlphaNumeric =
//                   RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(ctrlText);

//               FocusScope.of(context).unfocus();

//               if (ctrlText.isNotEmpty &&
//                   ctrlText.length <= 40 &&
//                   ctrlText.length >= 3 &&
//                   isAlphaNumeric) {
//                 ref.read(searchQueryProvider.notifier).state = controller.text;
//               }

//               controller.text = "";
//             },
//             decoration: const InputDecoration(
//               hintText: 'Search game...',
//               prefixIcon: Icon(
//                 Icons.search,
//               ),
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.all(16.0),
//             ),
//           ),
//         ),
//       ),
//       body: searchGameProvider.when(
//         data: (data) {
//           return ListView.builder(
//             itemCount: data.length,
//             itemBuilder: (BuildContext context, int index) {
//               final game = data[index];
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 3),
//                 child: ListTile(
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return Consumer(
//                           builder: (context, ref, child) {
//                             final favoriteProvider =
//                                 ref.watch(favoriteGameIdsProvider);
//                             return Dialog(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               child: SingleChildScrollView(
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       const SizedBox(height: 5),
//                                       Text(game.external!,
//                                           textAlign: TextAlign.center,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .titleSmall!
//                                               .copyWith(
//                                                 fontWeight: FontWeight.bold,
//                                               )),
//                                       const SizedBox(height: 5),
//                                       Wrap(
//                                         spacing: 5,
//                                         children: [
//                                           Text("Cheapest:"),
//                                           Text(
//                                             game.cheapest!,
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyLarge,
//                                           ),
//                                         ],
//                                       ),
//                                       IconButton(
//                                         onPressed: () {
//                                           ref
//                                               .read(favoriteGameIdsProvider
//                                                   .notifier)
//                                               .toggle(game.gameID!, context);

//                                           Timer(
//                                               const Duration(milliseconds: 650),
//                                               () {
//                                             Navigator.of(context).pop();
//                                           });
//                                         },
//                                         color: favoriteProvider
//                                                 .contains(game.gameID)
//                                             ? Colors.red
//                                             : Colors.grey,
//                                         icon: Icon(
//                                           favoriteProvider.contains(game.gameID)
//                                               ? Icons.favorite
//                                               : Icons.favorite_border,
//                                           size: 30,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     );
//                   },
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(8.0).r,
//                     child: CachedNetworkImage(
//                       imageUrl: game.thumb!,
//                       width: 90.w,
//                       height: 30.h,
//                       fit: BoxFit.fill,
//                       errorWidget: (context, url, error) => const ErrorIcon(),
//                     ),
//                   ),
//                   title: Text(
//                     game.external!,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context)
//                         .textTheme
//                         .labelLarge!
//                         .copyWith(fontSize: 13.sp),
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//         error: (error, stackTrace) {
//           return Text("Error: $error");
//         },
//         loading: () => const LoadProgressIndicator(),
//       ),
//     );
//   }
// }
