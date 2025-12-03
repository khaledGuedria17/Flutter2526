import 'dart:convert';
import 'package:hive/hive.dart';
part 'game.g.dart';

@HiveType(typeId: 0)
class Game {
  //att

  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  @HiveField(2)
  String description;
  @HiveField(3)
  int price;

  //constructor
  Game(this.image, this.name, this.price, this.description);

  //JSON serialization
  //encode
  Map<String, dynamic> toJson() {
    return {
      "title": name,
      //"name": this.price,
      "short_description": description,
      "thumbnail": image,
    };
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
