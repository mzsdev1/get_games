import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/services/ad_service/ads_service.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/providers/free_games/free_games_api_controller.dart';
import 'package:get_games/ui/views/free_games/free_games_index_view.dart';
import 'package:get_games/ui/widgets/common/appbar_title_text.dart';
import 'package:get_games/ui/widgets/common/empty_view.dart';
import 'package:get_games/ui/widgets/common/load_progress_indicator.dart';
import 'package:get_games/ui/widgets/free_games/free_games_bottom_sheet.dart';
import 'package:get_games/ui/widgets/free_games/free_games_main_card_body.dart';
import 'package:get_games/ui/widgets/free_games/type_dropdown_button.dart';

class FreeGamesListView extends ConsumerStatefulWidget {
  const FreeGamesListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FreeGamesViewState();
}

class _FreeGamesViewState extends ConsumerState<FreeGamesListView> {
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
    final freeGamesData = ref.watch(freeGamesProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title:
              AppBarTitleText(text: LocaleKeys.freeGamesView_appBarTitle.tr()),
          actions: const [
            TypeDropdownButton(),
            FreeGamesBottomSheet(),
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
                    ref.read(googleAdServiceProvider).showInterstitialAd();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            FreeGamesIndexView(freeGame: game),
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
