import 'dart:convert';

class Game {
  //att
  late String name, image, description;
  late int price;

  //constructor
  Game.empty();
  Game(this.image, this.name, this.price, this.description);

  //JSON serialization
  //encode
  static String toJson() {
    return '';
  }

  //decode
  static Game toGame(dynamic jsonData) {
    //var jsonData = json.decode(rawJson);
    return Game(
      jsonData['thumbnail'],
      jsonData['title'],
      0,
      jsonData['short_description'],
    );
  }
}
