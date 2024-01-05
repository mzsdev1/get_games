import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/providers/game_deals/game_deals_api_provider.dart';
import 'package:get_games/providers/game_deals/game_deals_store_provider.dart';
import 'package:get_games/ui/views/game_deals/game_deals_detail_view.dart';
import 'package:get_games/ui/widgets/common/appbar_title_text.dart';
import 'package:get_games/ui/widgets/common/empty_view.dart';
import 'package:get_games/ui/widgets/common/load_progress_indicator.dart';
import 'package:get_games/ui/widgets/game_deals/price_filter.dart';
import 'package:get_games/ui/widgets/game_deals/main_card_body.dart';
import 'package:get_games/ui/widgets/game_deals/store_dropdown_button.dart';

class GameDealsListView extends ConsumerWidget {
  const GameDealsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameDealsData = ref.watch(gameDealsApiProvider);
    final selectedStore = ref.watch(gameDealsstoreNameProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title:
              AppBarTitleText(text: LocaleKeys.gameDealsView_appBarTitle.tr()),
          actions: [
            StoreDropdownButton(selectedStore: selectedStore),
            const PriceFilter(),
          ],
        ),
      ),
      body: gameDealsData.when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final game = data[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            GameDealsDetailView(gameDeal: game),
                      ),
                    );
                  },
                  child: GameDealMainCardBody(
                    thumbUrl: game.thumb!,
                    gameTitle: game.title!,
                    saving: game.savings!,
                    gameSalePrice: game.salePrice!,
                    gameDealRate: game.dealRating!,
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
