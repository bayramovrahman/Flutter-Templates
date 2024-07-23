// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:gameify/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  // Just empty column

  final double height;
  final double width;
  final bool showTitle;
  final List<Game> gamesData;

  const ScrollableGamesWidget({
    super.key,
    required this.height,
    required this.width,
    required this.showTitle,
    required this.gamesData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: gamesData.map((_gameData) {
          return Container(
            height: height,
            width: width * 0.30,
            padding: EdgeInsets.only(
              right: width * 0.03,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: height * 0.80,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        _gameData.coverImage!.url,
                      ),
                    ),
                  ),
                ),
                showTitle
                    ? Text(
                        _gameData.title.toString(),
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.06,
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
