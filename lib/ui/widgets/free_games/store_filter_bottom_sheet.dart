import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/utils/constants/list_constants.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import '../../../providers/free_games/free_games_filter_provider.dart';

class StoreFilterBottomSheet extends StatelessWidget {
  const StoreFilterBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 25.w),
                            Text(
                              LocaleKeys.freeGamesView_platformsText
                                  .tr()
                                  .toUpperCase(),
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
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.close,
                                size: 23.w,
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Wrap(
                            children: ListConstants.allStoresList.map(
                              (filter) {
                                final isSelected = ref
                                    .watch(selectedFilterProvider)
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
                                          .read(selectedFilterProvider.notifier)
                                          .toggleFilter(filter);
                                    },
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
