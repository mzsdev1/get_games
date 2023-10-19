import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/providers/free_games/free_games_api_controller.dart';
import 'package:get_games/views/free_games/free_games_index_view.dart';
import 'package:get_games/widgets/common/appbar_title_text.dart';
import 'package:get_games/widgets/common/load_progress_indicator.dart';
import 'package:get_games/widgets/free_games/free_games_bottom_sheet.dart';
import 'package:get_games/widgets/free_games/free_games_main_card_body.dart';
import 'package:get_games/widgets/free_games/type_dropdown_button.dart';

final filters = [
  'epic-games-store',
  'steam',
  'gog',
  "itchio",
  "ubisoft",
  "origin",
  "drm-free",
];

final List<String> gameTypes = ["game", "loot"];

class FreeGamesView extends ConsumerStatefulWidget {
  const FreeGamesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FreeGamesViewState();
}

class _FreeGamesViewState extends ConsumerState<FreeGamesView> {
  @override
  Widget build(BuildContext context) {
    final freeGamesData = ref.watch(freeGamesProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: AppBar(
          title: const AppBarTitleText(text: "Giveaways"),
          actions: const [
            TypeDropdownButton(),
            FreeGamesBottomSheet(),
          ],
        ),
      ),
      body: freeGamesData.when(
        data: (data) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final game = data[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameFreeIndexView(freeGame: game),
                    ),
                  );
                },
                child: FreeGamesMainCardBody(
                    imagePath: game.image!,
                    title: game.title!,
                    platforms: game.platforms!,
                    price: game.worth!),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text(
              // "Something went wrong: ${error.toString()}", //TODO:
              // style: const TextStyle(color: Colors.red),
              "No active giveaways available at the moment, please try again later",
            ),
          );
        },
        loading: () => const LoadProgressIndicator(),
      ),
    );
  }
}
