import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/providers/game_deals/game_deals_store_provider.dart';
import 'package:get_games/views/game_deals/game_deals_list_view.dart';

class StoreDropdownButton extends StatelessWidget {
  const StoreDropdownButton({
    super.key,
    required this.selectedStore,
  });

  final StoreApiNameNotifier selectedStore;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => DropdownButton(
        value: selectedStore.selectedStoreLabel,
        onChanged: (value) {
          ref.read(storeNameProvider.notifier).changeStore(value!);
        },
        items: storeLabels.map<DropdownMenuItem<String>>(
          (value) {
            return DropdownMenuItem(
              value: value,
              child: Text(
                value.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14.sp,
                    ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
