// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_games/providers/game_deals/game_deals_api_provider.dart';
// import 'package:get_games/providers/game_deals/game_deals_store_provider.dart';
// import 'package:get_games/views/game_deals/game_deals_index_view.dart';
// import 'package:get_games/widgets/common/appbar_title_text.dart';
// import 'package:get_games/widgets/common/empty_view.dart';
// import 'package:get_games/widgets/common/load_progress_indicator.dart';
// import 'package:get_games/widgets/game_deals/deal_filter_select.dart';
// import 'package:get_games/widgets/game_deals/main_card_body.dart';
// import 'package:get_games/widgets/game_deals/store_dropdown_button.dart';

// final List<String> storeLabels = ["Steam", "Epic"];

// class GameDealsListView extends ConsumerStatefulWidget {
//   const GameDealsListView({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _GameDealsListViewState();
// }

// class _GameDealsListViewState extends ConsumerState<GameDealsListView> {
//   @override
//   Widget build(BuildContext context) {
//     final gameDealsData = ref.watch(gameDealsProvider);
//     final selectedStore = ref.watch(storeNameProvider);

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(54.5.h),
//         child: AppBar(
//           title: const AppBarTitleText(text: "Deals"),
//           actions: [
//             StoreDropdownButton(selectedStore: selectedStore),
//             const DealBottomSheet(),
//           ],
//         ),
//       ),
//       body: gameDealsData.when(
//         data: (data) {
//           if (data.isNotEmpty) {
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 final game = data[index];

//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => GameDealIndexView(gameDeal: game),
//                       ),
//                     );
//                   },
//                   child: GameDealMainCardBody(
//                     thumbUrl: game.thumb!,
//                     gameTitle: game.title!,
//                     saving: game.savings!,
//                     gameSalePrice: game.salePrice!,
//                     gameDealRate: game.dealRating!,
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/ads/ads_service.dart';
import 'package:get_games/providers/game_deals/game_deals_api_provider.dart';
import 'package:get_games/providers/game_deals/game_deals_store_provider.dart';
import 'package:get_games/views/game_deals/game_deals_index_view.dart';
import 'package:get_games/widgets/common/appbar_title_text.dart';
import 'package:get_games/widgets/common/empty_view.dart';
import 'package:get_games/widgets/common/load_progress_indicator.dart';
import 'package:get_games/widgets/game_deals/deal_filter_select.dart';
import 'package:get_games/widgets/game_deals/main_card_body.dart';
import 'package:get_games/widgets/game_deals/store_dropdown_button.dart';

final List<String> storeLabels = ["Steam", "Epic"];

class GameDealsListView extends ConsumerStatefulWidget {
  const GameDealsListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GameDealsListViewState();
}

class _GameDealsListViewState extends ConsumerState<GameDealsListView> {
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
    final gameDealsData = ref.watch(gameDealsProvider);
    final selectedStore = ref.watch(storeNameProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          title: const AppBarTitleText(text: "Deals"),
          actions: [
            StoreDropdownButton(selectedStore: selectedStore),
            const DealBottomSheet(),
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
                    ref.read(googleAdServiceProvider).showInterstitialAd();
                    //
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameDealIndexView(gameDeal: game),
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
