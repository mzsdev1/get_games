// import 'dart:async';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_games/providers/game_search/game_search_api_provider.dart';
// import 'package:get_games/widgets/common/empty_view.dart';
// import 'package:get_games/widgets/common/error_image.dart';
// import 'package:get_games/widgets/common/load_progress_indicator.dart';
// import 'package:get_games/widgets/game_search/search_dialog.dart';

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

//     Timer? debounceTimer;

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(54.5.h),
//         child: AppBar(
//           surfaceTintColor: Colors.transparent,
//           title: TextField(
//             controller: controller,
//             onSubmitted: (_) {
//               FocusScope.of(context).unfocus();

//               //controller.text = "";
//             },
//             //todo: search empty space ! maybe
//             onChanged: (value) {
//               String currentText = '';
//               final ctrlText = value;
//               final trimmedText = ctrlText.trim();
//               final isMatch = RegExp(r'[a-zA-Z0-9 ]').hasMatch(trimmedText);

//               if (trimmedText.isNotEmpty &&
//                   trimmedText.length <= 40 &&
//                   trimmedText.length >= 3 &&
//                   isMatch) {
//                 currentText = trimmedText;
//                 if (debounceTimer != null) {
//                   debounceTimer!.cancel(); // İşlem beklemesini iptal et
//                 }
//                 debounceTimer = Timer(const Duration(milliseconds: 600), () {
//                   // Bekleme süresi sona erdiğinde işlem yapılacak
//                   print(
//                       currentText); // API isteği göndermeden önce işlem yapabilirsiniz
//                   ref.read(searchQueryProvider.notifier).state = currentText;
//                 });
//               }
//             },

//             decoration: InputDecoration(
//               hintText: 'Search game',
//               prefixIcon: Icon(
//                 Icons.search,
//                 size: 24.r,
//               ),
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   final isEmpty =
//                       ref.watch(searchQueryProvider.notifier).state != "";

//                   controller.clear();

//                   if (isEmpty) {
//                     ref.read(searchQueryProvider.notifier).state = "";
//                   }
//                   print(isEmpty.toString());
//                 },
//                 icon: Icon(
//                   Icons.clear,
//                   size: 24.r,
//                 ),
//               ),
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.all(2.0).r,
//             ),
//           ),
//         ),
//       ),
//       body: searchGameProvider.when(
//         data: (data) {
//           if (data.isNotEmpty) {
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final game = data[index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 2).r,
//                   child: ListTile(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return SearchDialog(game: game);
//                         },
//                       );
//                     },
//                     leading: ClipRRect(
//                       borderRadius: BorderRadius.circular(8.0).r,
//                       child: CachedNetworkImage(
//                         imageUrl: game.thumb!,
//                         width: 90.w,
//                         height: 30.h,
//                         fit: BoxFit.fill,
//                         errorWidget: (context, url, error) => const ErrorIcon(),
//                       ),
//                     ),
//                     title: Text(
//                       game.external!,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context)
//                           .textTheme
//                           .labelLarge!
//                           .copyWith(fontSize: 13.sp),
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

//todo ad3

import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/ads/ads_service.dart';
import 'package:get_games/providers/game_search/game_search_api_provider.dart';
import 'package:get_games/widgets/common/empty_view.dart';
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
  void initState() {
    super.initState();
    ref.read(googleAdServiceProvider).createInterstitialAd();
  }

  @override
  void dispose() {
    super.dispose();
    ref.watch(googleAdServiceProvider).interstitialAd?.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchGameProvider = ref.watch(gameSearchProvider);

    Timer? debounceTimer;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title: TextField(
            controller: controller,
            onSubmitted: (_) {
              FocusScope.of(context).unfocus();

              //controller.text = "";
            },
            //todo: search empty space ! maybe
            onChanged: (value) {
              String currentText = '';
              final ctrlText = value;
              final trimmedText = ctrlText.trim();
              final isMatch = RegExp(r'[a-zA-Z0-9 ]').hasMatch(trimmedText);

              if (trimmedText.isNotEmpty &&
                  trimmedText.length <= 40 &&
                  trimmedText.length >= 3 &&
                  isMatch) {
                currentText = trimmedText;
                if (debounceTimer != null) {
                  debounceTimer!.cancel(); // İşlem beklemesini iptal et
                }
                debounceTimer = Timer(const Duration(milliseconds: 600), () {
                  // Bekleme süresi sona erdiğinde işlem yapılacak
                  print(
                      currentText); // API isteği göndermeden önce işlem yapabilirsiniz
                  ref.read(searchQueryProvider.notifier).state = currentText;
                });
              }
            },

            decoration: InputDecoration(
              hintText: 'Search game',
              prefixIcon: Icon(
                Icons.search,
                size: 24.r,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  final isEmpty =
                      ref.watch(searchQueryProvider.notifier).state != "";

                  controller.clear();

                  if (isEmpty) {
                    ref.read(searchQueryProvider.notifier).state = "";
                  }
                  print(isEmpty.toString());
                },
                icon: Icon(
                  Icons.clear,
                  size: 24.r,
                ),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(2.0).r,
            ),
          ),
        ),
      ),
      body: searchGameProvider.when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final game = data[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2).r,
                  child: ListTile(
                    onTap: () {
                      ref.read(googleAdServiceProvider).showInterstitialAd();
                      //
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
