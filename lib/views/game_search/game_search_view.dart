import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchGameProvider = ref.watch(gameSearchProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title: TextFormField(
            controller: controller,
            // onSubmitted: (_) {
            //   FocusScope.of(context).unfocus();

            //   //controller.text = "";
            // },

            //todo: test
            onChanged: (value) {
              final ctrlText = controller.text;
              // final ctrlText = value;
//test:

              //test
              bool isAlphaNumeric =
                  RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(ctrlText);

              // Use a debounce timer to prevent sending too many requests
              Timer? timer;
              if (timer != null) {
                timer.cancel();
              }

              timer = Timer(const Duration(milliseconds: 600), () {
                if (ctrlText.isNotEmpty &&
                    ctrlText.length <= 40 &&
                    ctrlText.length >= 3 &&
                    isAlphaNumeric) {
                  ref.read(searchQueryProvider.notifier).state = ctrlText;
                }
              });
            },
            //todo. test 1
            // validator: (value) {},
            // inputFormatters: [
            //   FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
            // ],

            // onChanged: (value) {
            //   final ctrlText = controller.text.trim();
            //   // final ctrlText = value;
            //   bool isAlphaNumeric =
            //       RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(ctrlText);

            //   // Use a debounce timer to prevent sending too many requests
            //   if ((ctrlText.isEmpty || !RegExp(r'\s').hasMatch(ctrlText)) &&
            //       ctrlText.length <= 40 &&
            //       ctrlText.length >= 3 &&
            //       isAlphaNumeric) {
            //     ref.read(searchQueryProvider.notifier).state = ctrlText;
            //   }
            // },

            // onChanged: (value) {
            //   final ctrlText = controller.text;
            //   //test:
            //   List<String> lines = ctrlText.split('\n');
            //   lines = lines.where((line) => line.trim().isNotEmpty).toList();
            //   String updatedText = lines.join('\n');
            //   controller.text =
            //       updatedText; // Use controller.text to update the text

            //   //test
            //   bool isAlphaNumeric = RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(
            //       updatedText); // Check isAlphaNumeric with updatedText

            //   // Use a debounce timer to prevent sending too many requests
            //   Timer? timer;
            //   if (timer != null) {
            //     timer.cancel();
            //   }

            //   timer = Timer(const Duration(milliseconds: 600), () {
            //     if (updatedText.isNotEmpty &&
            //         updatedText.length <= 40 &&
            //         updatedText.length >= 3 &&
            //         isAlphaNumeric) {
            //       ref.read(searchQueryProvider.notifier).state = updatedText;
            //     }
            //   });
            // },

            decoration: InputDecoration(
              hintText: 'Search game',
              prefixIcon: const Icon(
                Icons.search,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: const Icon(Icons.clear),
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
