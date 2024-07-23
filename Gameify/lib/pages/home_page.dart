// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/material.dart';
import 'package:gameify/data.dart';
import 'package:gameify/widgets/drawer_widget.dart';
import 'package:gameify/widgets/scrollable_games_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Just empty column

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late double _deviceHeight;
  late double _deviceWidth;
  late double _circleRadius;
  late int _selectedGame;

  @override
  void initState() {
    super.initState();
    _selectedGame = 0;
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            _featuredGamesWidget(),
            // _gradientBoxWidget(),
            _topLayerWidget(),
          ],
        ),
      ),
      drawer: const MyDrawerMenu(),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
      height: _deviceHeight * 0.50,
      width: _deviceWidth,
      child: PageView(
        onPageChanged: (_indexValue) {
          setState(() {
            _selectedGame = _indexValue;
          });
        },
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((_game) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(_game.coverImage!.url),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.80,
        width: _deviceWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(35, 45, 59, 1.0),
              Colors.transparent,
            ],
            stops: [0.35, 1.0],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _deviceWidth * 0.05,
        vertical: _deviceHeight * 0.005,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _topBarWidget(),
          SizedBox(
            height: _deviceHeight * 0.13,
          ),
          _featuredGamesInfoWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeight * 0.01,
            ),
            child: ScrollableGamesWidget(
              height: _deviceHeight * 0.25,
              width: _deviceWidth,
              showTitle: true,
              gamesData: games1,
            ),
          ),
          _featuredGameBannerWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: _deviceHeight * 0.01,
            ),
            child: ScrollableGamesWidget(
              height: _deviceHeight * 0.25,
              width: _deviceWidth,
              showTitle: true,
              gamesData: games2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.search,
                color: Colors.white,
                size: 30.0,
              ),
              SizedBox(width: _deviceWidth * 0.03),
              const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _featuredGamesInfoWidget() {
    return SizedBox(
      height: _deviceHeight * 0.12,
      width: _deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            featuredGames[_selectedGame].title.toString(),
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: _deviceHeight * 0.030,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: _deviceHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: featuredGames.map((_game) {
              bool _isActive =
                  _game.title == featuredGames[_selectedGame].title;
              _circleRadius = _deviceHeight * 0.004;
              return Container(
                height: _circleRadius * 2,
                width: _circleRadius * 2,
                margin: EdgeInsets.only(right: _deviceWidth * 0.01),
                decoration: BoxDecoration(
                  color: _isActive ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(100.0),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _featuredGameBannerWidget() {
    return Container(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            featuredGames[4].coverImage!.url,
          ),
        ),
      ),
    );
  }

  // Just empty column
}
