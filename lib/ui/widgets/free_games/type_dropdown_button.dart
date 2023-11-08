import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import '../../../providers/free_games/freegames_api_filter.dart';

class TypeDropdownButton extends StatelessWidget {
  const TypeDropdownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final typeProvider = ref.watch(selectedGameTypeProvider);
        return DropdownButton(
          value: typeProvider,
          onChanged: (value) {
            ref
                .read(selectedGameTypeProvider.notifier)
                .setSelectedGameType(value!);
          },
          items: [
            DropdownMenuItem(
              value: "game",
              child: Text(
                LocaleKeys.freeGamesView_gameText.tr().toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
            ),
            DropdownMenuItem(
              value: "loot",
              child: Text(
                LocaleKeys.freeGamesView_lootText.tr().toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
