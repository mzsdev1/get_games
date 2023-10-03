// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_games/models/game_deals_model.dart';
import 'package:get_games/widgets/common/deal_date_container.dart';
import 'package:get_games/widgets/common/full_container.dart';
import 'package:get_games/widgets/common/get_button.dart';
import 'package:get_games/widgets/common/half_container.dart';
import 'package:get_games/widgets/common/rate_container.dart';

class GameDealIndexView extends ConsumerWidget {
  const GameDealIndexView({super.key, required this.gameDeal});

  final GameDealsModel gameDeal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    textAlign: TextAlign.center,
                    gameDeal.title!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ), // Adjust the radius as needed
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        height: 57,
                        width: 150,
                        imageUrl: gameDeal.thumb!,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 57,
                        //width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              //color: Colors.grey.withOpacity(0.5),
                              color: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\$${gameDeal.normalPrice}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    decoration: TextDecoration
                                        .lineThrough, // Üstü çizgiyi etkinleştirir
                                    // decorationColor: Colors
                                    //     .red, // Çizgi rengini belirleyebilirsiniz
                                    decorationThickness:
                                        2.0, // Çizgi kalınlığını ayarlayabilirsiniz
                                    decorationStyle: TextDecorationStyle.solid,
                                  ),
                            ),
                            Text(
                              gameDeal.savings!,
                              style: Theme.of(context).textTheme.labelLarge!,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const FullContainer(header: "Platform", info: "Steam"),
                Row(
                  children: [
                    HalfContainer(
                        header: "Rating Count",
                        info: gameDeal.steamRatingCount!),
                    const SizedBox(
                      width: 30,
                    ),
                    const HalfContainer(header: "Type", info: "Game"),
                  ],
                ),
                Row(
                  children: [
                    RateContainer(
                      rateTitle: "Deal Score",
                      infoWidget: Text(gameDeal.dealRating ?? "0"),
                    ),
                    const SizedBox(width: 10),
                    RateContainer(
                      rateTitle: "Metacritic",
                      infoWidget: Text(gameDeal.metacriticScore ?? "0"),
                    ),
                    const SizedBox(width: 10),
                    RateContainer(
                      rateTitle: "Rate",
                      infoWidget:
                          Text("%${gameDeal.steamRatingPercent}" ?? "%0"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                FullContainer(
                    header: "Reviews", info: gameDeal.steamRatingText),
                const SizedBox(
                  height: 8,
                ),
                DealDateContainer(
                    releaseDate: gameDeal.releaseDate!.toString(),
                    lastChange: gameDeal.releaseDate!.toString()),
                const SizedBox(
                  height: 8,
                ),
                GetButton(
                  buttonText: "Get",
                  buttonFunction: () {},
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
