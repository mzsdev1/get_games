// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_games/providers/game_search/game_search_api_provider.dart';
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

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(44.h),
//         child: AppBar(
//           surfaceTintColor: Colors.transparent,
//           title: TextField(
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
//             decoration: InputDecoration(
//               hintText: 'Search game',
//               prefixIcon: const Icon(
//                 Icons.search,
//               ),
//               border: InputBorder.none,
//               contentPadding: const EdgeInsets.all(12.5).r,
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
//                 padding: const EdgeInsets.symmetric(horizontal: 2).r,
//                 child: ListTile(
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return SearchDialog(game: game);
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

//Todo:2

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.h),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title: TextField(
            controller: controller,
            onSubmitted: (_) {
              // final ctrlText = controller.text.trim();
              // bool isAlphaNumeric =
              //     RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(ctrlText);

              FocusScope.of(context).unfocus();

              // if (ctrlText.isNotEmpty &&
              //     ctrlText.length <= 40 &&
              //     ctrlText.length >= 3 &&
              //     isAlphaNumeric) {
              //   ref.read(searchQueryProvider.notifier).state = controller.text;
              // }

              controller.text = "";
            },
            onChanged: (value) {
              final ctrlText = controller.text.trim();
              bool isAlphaNumeric =
                  RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(ctrlText);

              //FocusScope.of(context).unfocus();

              if (ctrlText.isNotEmpty &&
                  ctrlText.length <= 40 &&
                  ctrlText.length >= 3 &&
                  isAlphaNumeric) {
                ref.read(searchQueryProvider.notifier).state = controller.text;
              }

              //controller.text = "";
            },
            decoration: InputDecoration(
              hintText: 'Search game',
              prefixIcon: const Icon(
                Icons.search,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(12.5).r,
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
