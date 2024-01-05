import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/data/models/favorite_games_model.dart';
import 'package:get_games/providers/favorite_games/store_name_provider.dart';

class FavoritePriceListDialog extends StatelessWidget {
  const FavoritePriceListDialog({
    super.key,
    required this.deals,
  });

  final List<Deals>? deals;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0).r,
        ),
        child: Container(
          width: 250.w,
          height: 200.h,
          padding: const EdgeInsets.all(15.0).r,
          child: Scrollbar(
            thumbVisibility: true,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: deals!.length,
              itemBuilder: (context, index) {
                final deal = deals![index];
                final storeName = ref
                    .watch(storeNameProvider)
                    .getStoreNameById(deal.storeID!);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 3.w,
                      children: [
                        Text(
                          "$storeName:",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp,
                                  ),
                        ),
                        Text(
                          "\$${deal.price!}",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontSize: 13.sp,
                                  ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Theme.of(context).dividerColor,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
