import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/providers/game_deals/game_deals_price_provider.dart';
import 'package:get_games/providers/game_deals/game_deals_store_provider.dart';

final List<String> storeLabels = ["Steam", "Epic Games"];

class DealBottomSheet extends StatelessWidget {
  const DealBottomSheet({
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
                final selectedStore = ref.watch(storeNameProvider);
                //todo
                final minV = ref.watch(gameDealsMinPriceProvider);
                final maxV = ref.watch(gameDealsMaxPriceProvider);

                return SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const Text("Select store"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton(
                                value: selectedStore.selectedStoreLabel,
                                onChanged: (value) {
                                  ref
                                      .read(storeNameProvider.notifier)
                                      .changeStore(value!);
                                },
                                items:
                                    storeLabels.map<DropdownMenuItem<String>>(
                                  (value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
                                      ),
                                    );
                                  },
                                ).toList()),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Select minimum price"),
                          RangeSlider(
                            labels: RangeLabels(
                              '\$${minV.toStringAsFixed(0)}',
                              '\$${maxV.toStringAsFixed(0)}',
                            ),
                            values: RangeValues(minV, maxV),
                            min: 0,
                            max: 80,
                            divisions: 8,
                            onChanged: (RangeValues values) {
                              ref
                                  .read(gameDealsMinPriceProvider.notifier)
                                  .state = values.start;
                              ref
                                  .read(gameDealsMaxPriceProvider.notifier)
                                  .state = values.end;
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      icon: const Icon(Icons.filter_list),
    );
  }
}
