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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: freeGame.image,
              //height: deviceHeight / 4,
              width: deviceWidth,
              height: deviceHeight * 0.22,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    freeGame.title,
                    style: TextStyle(
                      fontSize: 7.5 * MediaQuery.of(context).devicePixelRatio,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      HalfContainer(header: "Price", info: freeGame.worth),
                      const SizedBox(width: 40),
                      HalfContainer(header: "Type", info: freeGame.type),
                    ],
                  ),
                  SizedBox(height: 10),
                  FullContainer(header: "Platforms", info: freeGame.platforms),
                  Column(
                    children: [
                      const Text(
                        "Description",
                        textAlign: TextAlign.left,
                      ),
                      Text(freeGame.description),
                    ],
                  ),
                  const SizedBox(height: 10),
                  FullContainer(header: "End Date", info: freeGame.endDate),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      const Text(
                        "Instructions",
                        textAlign: TextAlign.left,
                      ),
                      Text(freeGame.instructions),
                    ],
                  ),
                  SizedBox(height: 10),
                  GetButton(
                    buttonText: "Get",
                    buttonFunction: () {},
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
