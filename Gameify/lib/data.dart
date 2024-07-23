class GameImage {
  String url;
  String title;

  GameImage(this.url, this.title);
}

class Game {
  String? title;
  GameImage? coverImage;
  List<GameImage>? images;
  String? description;
  String? studio;

  Game(this.title, this.coverImage, this.description, this.studio);
}

// -----------------------------------------------------------------------------------------

List<Game> games1 = [
  Game(
    "Horizon Zero Dawn",
    GameImage(
      "assets/images/games1/horizon-zero-dawn.jpg",
      "",
    ),
    "",
    "Guerrilla Games",
  ),
  Game(
    "Metro Exodus",
    GameImage(
      "assets/images/games1/metro-exodus.jpg",
      "",
    ),
    "",
    "4A Games",
  ),
  Game(
    "Tom Clancy's The Division 2",
    GameImage(
      "assets/images/games1/tc-the-division.jpg",
      "",
    ),
    "",
    "Massive Entertainment",
  ),
  Game(
    "Resident Evil 2",
    GameImage(
      "assets/images/games1/resident-evil.jpg",
      "",
    ),
    "",
    "Capcom",
  ),
    Game(
    "Game of Thrones",
    GameImage(
      "assets/images/games1/game-of-thrones.jpg",
      "",
    ),
    "",
    "Capcom",
  ),
];

// -----------------------------------------------------------------------------------------

List<Game> games2 = [
  Game(
    "Grand Theft Auto V",
    GameImage(
      "assets/images/games2/1.webp",
      "",
    ),
    "",
    "Rockstar Games",
  ),
  Game(
    "TEKKEN 8",
    GameImage("assets/images/games2/2.webp", ""),
    "",
    "Naughty Dog",
  ),
  Game(
    "TerraScape",
    GameImage(
      "assets/images/games2/3.webp",
      "",
    ),
    "",
    "From Software",
  ),
  Game(
    "Flintlock: The Siege of Dawn",
    GameImage(
      "assets/images/games2/4.webp",
      "",
    ),
    "",
    "Avalanche Studios",
  ),
];

// -----------------------------------------------------------------------------------------

List<Game> featuredGames = [
  Game(
    "Mischief Joker",
    GameImage(
      "assets/images/featured_games/mischief-joker.jpg",
      "",
    ),
    "",
    "Feral Interactive",
  ),
  Game(
    "Call of Duty: Modern Warfare",
    GameImage(
      "assets/images/featured_games/call-of-duty-mobile-warzone.jpg",
      "",
    ),
    "",
    "Infinity Ward",
  ),
  Game(
    "Marvel Deadpool And Wolverine",
    GameImage(
      "assets/images/featured_games/marvel-deadpool-and-wolverine.jpg",
      "",
    ),
    "",
    "CyberConnect2",
  ),
  Game(
    "Defender Of Earth Superman",
    GameImage(
      "assets/images/featured_games/defender-of-earth-superman.jpg",
      "",
    ),
    "",
    "NetherRealm Studios",
  ),
  Game(
    "Ryu Street Fighter",
    GameImage(
      "assets/images/featured_games/ryu-street-fighter.jpg",
      "",
    ),
    "",
    "Marvel Studios",
  ),
];
