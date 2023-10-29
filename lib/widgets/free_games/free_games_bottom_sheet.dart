import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/providers/free_games/free_games_api_controller.dart';
import 'package:get_games/views/free_games/free_games_list_view.dart';

class FreeGamesBottomSheet extends StatelessWidget {
  const FreeGamesBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Timer? debounceTimer;
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Consumer(
              builder: (context, ref, child) {
                return SizedBox(
                  height: 240.h,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 2,
                    ).r,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 25.w),
                            Text(
                              "PLATFORMS",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                context.router.pop();
                              },
                              icon: Icon(
                                Icons.close,
                                size: 23.w,
                                // color: Theme.of(context).colorScheme.error,
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Wrap(
                            children: filters.map(
                              (filter) {
                                final isSelected = ref
                                    .watch(selectedFiltersProvider)
                                    .contains(filter);

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 4,
                                  ).r,
                                  child: FilterChip(
                                    label: Text(
                                      filter.replaceAll("-", " ").toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            fontSize: 12.5.sp,
                                          ),
                                    ),
                                    selected: isSelected,
                                    onSelected: (_) {
                                      ref
                                          .read(
                                              selectedFiltersProvider.notifier)
                                          .toggleFilter(filter);
                                    },

                                    //todo
                                    // onSelected: (_) {
                                    //   if (debounceTimer != null) {
                                    //     debounceTimer!.cancel();
                                    //   }
                                    //   debounceTimer = Timer(
                                    //       const Duration(milliseconds: 500),
                                    //       () {
                                    //     ref
                                    //         .read(selectedFiltersProvider
                                    //             .notifier)
                                    //         .toggleFilter(filter);
                                    //   });
                                    // },
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      icon: Icon(
        Icons.filter_list,
        size: 24.r,
      ),
    );
  }
}
