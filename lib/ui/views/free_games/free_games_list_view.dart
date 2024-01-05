import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/providers/free_games/free_games_api_provider.dart';
import 'package:get_games/ui/views/free_games/free_games_detail_view.dart';
import 'package:get_games/ui/widgets/common/appbar_title_text.dart';
import 'package:get_games/ui/widgets/common/empty_view.dart';
import 'package:get_games/ui/widgets/common/load_progress_indicator.dart';
import 'package:get_games/ui/widgets/free_games/store_filter_bottom_sheet.dart';
import 'package:get_games/ui/widgets/free_games/free_games_card_body.dart';
import 'package:get_games/ui/widgets/free_games/type_dropdown_button.dart';

class FreeGamesListView extends ConsumerWidget {
  const FreeGamesListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final freeGamesData = ref.watch(freeGamesApiProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title:
              AppBarTitleText(text: LocaleKeys.freeGamesView_appBarTitle.tr()),
          actions: const [
            TypeDropdownButton(),
            StoreFilterBottomSheet(),
          ],
        ),
      ),
      body: freeGamesData.when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final game = data[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            FreeGamesDetailView(freeGame: game),
                      ),
                    );
                  },
                  child: FreeGamesCardBody(
                      imagePath: game.image!,
                      title: game.title!,
                      platforms: game.platforms!,
                      price: game.worth!),
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
