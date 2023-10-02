// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GameDealMainCardBody extends StatelessWidget {
  const GameDealMainCardBody({
    Key? key,
    required this.thumbUrl,
    required this.gameTitle,
    required this.gameSalePrice,
    required this.gameDealRate,
  }) : super(key: key);
  final String thumbUrl;
  final String gameTitle;
  final String gameSalePrice;
  final String gameDealRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      child: Card(
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: thumbUrl,
                height: 55,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Container(
                  width: double
                      .infinity, // Make the container take up all available width
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gameTitle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Wrap(
                            spacing: 5,
                            children: [
                              Text("Price:"),
                              Text(
                                gameSalePrice,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: 70,
                            //color: Colors.amber,
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: 'Rate: ',
                                style: DefaultTextStyle.of(context)
                                    .style
                                    .copyWith(color: Colors.teal),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: gameDealRate,
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
