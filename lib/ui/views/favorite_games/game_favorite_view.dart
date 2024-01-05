import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/providers/favorite_games/favorite_games_api_provider.dart';
import 'package:get_games/providers/favorite_games/favorite_games_id_provider.dart';
import 'package:get_games/ui/widgets/common/appbar_title_text.dart';
import 'package:get_games/ui/widgets/common/empty_view.dart';
import 'package:get_games/ui/widgets/common/error_image.dart';
import 'package:get_games/ui/widgets/common/load_progress_indicator.dart';
import 'package:get_games/ui/widgets/game_favorite/delete_favorite_dialog.dart';
import 'package:get_games/ui/widgets/game_favorite/favorite_price_list_dialog.dart';

class FavoriteGamesView extends ConsumerWidget {
  const FavoriteGamesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favGamesData = ref.watch(favoriteGamesApiProvider);
    final favGamesIdList = ref.watch(favoriteGamesIdProvider);

    return Scaffold(
      floatingActionButton: favGamesIdList.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DeleteFavoriteDialog();
                  },
                );
              },
              child: const Icon(
                Icons.delete,
              ),
            )
          : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title: AppBarTitleText(
              text: LocaleKeys.favoriteGamesView_appBarTitle.tr()),
        ),
      ),
      body: favGamesData.when(
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
                      child: Dismissible(
                        key: Key(game.info!.gameID!),
                        onDismissed: (direction) {
                          ref
                              .read(favoriteGamesIdProvider.notifier)
                              .toggle(game.info!.gameID!, context);
                        },
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
