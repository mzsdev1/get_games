import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_games/localizations/locale_keys.g.dart';
import 'package:get_games/providers/game_deals/game_deals_price_provider.dart';
import 'package:get_games/ui/widgets/game_deals/slider_price_text.dart';

class PriceFilter extends StatelessWidget {
  const PriceFilter({
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
                final minV = ref.watch(gameDealsMinPriceProvider);
                final maxV = ref.watch(gameDealsMaxPriceProvider);

                return SizedBox(
                  height: 200.h,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 19.w),
                            Text(
                              LocaleKeys.commonTexts_priceText.tr(),
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
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 40.w,
                            ),
                            SliderPriceText(
                                label:
                                    "${LocaleKeys.gameDealsView_minPrice.tr()}:",
                                priceData: '\$${minV.toStringAsFixed(0)}'),
                            const Spacer(),
                            SliderPriceText(
                                label:
                                    "${LocaleKeys.gameDealsView_maxPrice.tr()}:",
                                priceData: '\$${maxV.toStringAsFixed(0)}'),
                            SizedBox(
                              width: 40.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        RangeSlider(
                          labels: RangeLabels(
                            '\$${minV.toStringAsFixed(0)}',
                            '\$${maxV.toStringAsFixed(0)}',
                          ),
                          values: RangeValues(minV, maxV),
                          min: 0.10,
                          max: 80.0,
                          divisions: 8,
                          onChanged: (RangeValues values) {
                            ref.read(gameDealsMinPriceProvider.notifier).state =
                                values.start;
                            ref.read(gameDealsMaxPriceProvider.notifier).state =
                                values.end;
                          },
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
        Icons.tune,
        size: 24.r,
      ),
    );
  }
}
