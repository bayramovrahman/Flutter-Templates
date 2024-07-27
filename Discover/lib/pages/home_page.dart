// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:discover_app/data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Just empty column

  final List<String> _locations = [
    'Singapore',
    'Japan',
    'Russia',
    'United Kingdom'
  ];
  final int _activeLocation = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: false,
        right: false,
        minimum: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.01,
          0,
          MediaQuery.of(context).size.width * 0.01,
          0,
        ),
        child: _mainColumn(context),
      ),
    );
  }

  Widget _mainColumn(BuildContext _context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Icon(
                Icons.menu,
                color: Colors.black87,
                size: 35.0,
              ),
              Container(
                width: 180,
                height: 50.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/logo_discover.png",
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.search,
                color: Colors.black87,
                size: 35.0,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02,
            ),
            child: _locationsBar(_context),
          ),
          _articlesList(_context),
        ],
      ),
    );
  }

  Widget _locationsBar(BuildContext _context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: _locations.map(
          (value) {
            bool _isActive =
                _locations[_activeLocation] == value ? true : false;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: _isActive ? Colors.white : Colors.white38,
                    fontSize: 16.0,
                  ),
                ),
                _isActive
                    ? Container(
                        width: 30.0,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.redAccent,
                        ),
                      )
                    : Container(),
              ],
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _articlesList(BuildContext _context) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.height * 0.005,
                  right: MediaQuery.of(context).size.height * 0.005,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(articles[index].image),
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 2.0,
                          blurRadius: 20.0,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: _articleInfoColumn(context, index),
                  ),
                ),
              ),
              Positioned(
                bottom: 8.0,
                left: MediaQuery.of(context).size.width * 0.14,
                child: _socialInfoContainer(context, index),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _articleInfoColumn(BuildContext _context, int _index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
          child: _authorInfoRow(_context, _index),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            30,
            MediaQuery.of(context).size.height * 0.05,
            30,
            0,
          ),
          child: _detailInfoRow(_context, _index),
        ),
      ],
    );
  }

  Widget _authorInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/profile.jpg',
                  ),
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
                left: 5.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    articles[_index].author,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "3 hours ago",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Column(
          children: <Widget>[
            Icon(
              Icons.favorite,
              size: 30.0,
              color: Colors.red,
            ),
            SizedBox(height: 1.0),
            Icon(
              Icons.bookmark_add,
              size: 30.0,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  Widget _detailInfoRow(BuildContext _context, int _index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.play_arrow,
            color: Colors.redAccent,
            size: 40.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                child: Text(
                  articles[_index].title,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                articles[_index].location,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20.0,
                  ),
                  Icon(
                    Icons.star_half,
                    color: Colors.orange,
                    size: 20.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _socialInfoContainer(BuildContext _context, int _index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(
                Icons.favorite_border,
                color: Colors.redAccent,
              ),
              Text(
                articles[_index].likes.toString(),
                style: const TextStyle(color: Colors.redAccent),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.comment,
                color: Colors.black54,
              ),
              Text(
                articles[_index].comments.toString(),
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const Icon(
                Icons.share,
                color: Colors.black54,
              ),
              Text(
                articles[_index].shares.toString(),
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Just empty column
}
