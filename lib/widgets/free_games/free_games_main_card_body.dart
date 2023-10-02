import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FreeGamesMainCardBody extends StatelessWidget {
  final String imagePath;
  final String title;
  final String platforms;
  final String price;

  const FreeGamesMainCardBody({
    super.key,
    required this.imagePath,
    required this.title,
    required this.platforms,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: 'Platforms: ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: platforms),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: 'Price: ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(text: price),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
