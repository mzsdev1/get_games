import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_games/models/free_games_model.dart';

// class GameFreeIndexView extends StatelessWidget {
//   const GameFreeIndexView({super.key, required this.freeGame});

//   final FreeGamesModel freeGame;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(freeGame.title),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//             child: Column(
//           children: [
//             Image.network(freeGame.image),
//           ],
//         )),
//       ),
//     );
//   }
// }

class GameFreeIndexView extends StatelessWidget {
  const GameFreeIndexView({super.key, required this.freeGame});

  final FreeGamesModel freeGame;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 140,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: freeGame.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
