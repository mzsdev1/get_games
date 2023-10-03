import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_games/models/free_games_model.dart';
import 'package:get_games/widgets/common/full_container.dart';
import 'package:get_games/widgets/common/get_button.dart';
import 'package:get_games/widgets/common/half_container.dart';

class GameFreeIndexView extends StatelessWidget {
  const GameFreeIndexView({super.key, required this.freeGame});

  final FreeGamesModel freeGame;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    final double deviceHeight = mediaQueryData.size.height;

    final double deviceWidth = mediaQueryData.size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: freeGame.image,
              //height: deviceHeight / 4,
              width: deviceWidth,
              //height: deviceHeight * 0.229,
              height: deviceHeight * 0.3,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      freeGame.title,
                      style: TextStyle(
                        fontSize: 7.5 * MediaQuery.of(context).devicePixelRatio,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      HalfContainer(header: "Price", info: freeGame.worth),
                      const SizedBox(width: 30),
                      HalfContainer(header: "Type", info: freeGame.type),
                    ],
                  ),
                  SizedBox(height: 10),
                  FullContainer(header: "Platforms", info: freeGame.platforms),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Description",
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          freeGame.description,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  FullContainer(header: "End Date", info: freeGame.endDate),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Instructions",
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          freeGame.instructions,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: GetButton(
                      buttonText: "Get",
                      buttonFunction: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
