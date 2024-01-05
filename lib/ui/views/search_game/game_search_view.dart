import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/providers/game_search/game_search_api_provider.dart';
import 'package:get_games/ui/widgets/common/empty_view.dart';
import 'package:get_games/ui/widgets/common/error_image.dart';
import 'package:get_games/ui/widgets/common/load_progress_indicator.dart';
import 'package:get_games/ui/widgets/game_search/search_dialog.dart';

import '../../../utils/helper/search_query_handler.dart';

class SearchGameView extends ConsumerStatefulWidget {
  const SearchGameView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameSearchViewState();
}

class _GameSearchViewState extends ConsumerState<SearchGameView> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchGameProvider = ref.watch(gameSearchApiProvider);

    final searchQueryHandler = SearchQueryHandler();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.5.h),
        child: AppBar(
          surfaceTintColor: Colors.transparent,
          title: TextField(
            controller: controller,
            onSubmitted: (_) {
              FocusScope.of(context).unfocus();
            },
            onChanged: (value) {
              searchQueryHandler.handleTextChange(value, ref);
            },
            decoration: InputDecoration(
              hintText: LocaleKeys.searchGameView_textfieldHintText.tr(),
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
