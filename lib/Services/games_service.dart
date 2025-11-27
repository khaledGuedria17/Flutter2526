import 'dart:convert';

import 'package:myapp/Models/game.dart';
import 'package:http/http.dart' as http;

class GamesService {
  //CRUD Games
  //1 : Fetch All
  Future<List<Game>> getAll() async {
    //var
    List<Game> games = [];
    //url
    var uri = Uri.parse("https://www.freetogame.com/api/games");

    await http.get(uri).then((response) {
      if (response.statusCode == 200) {
        List<dynamic> jsonArray = json.decode(response.body);
        for (var element in jsonArray) {
          games.add(Game.toGame(element));
        }
      } else {
        print("Error Fetching Games");
      }
    });

    return games;
  }
}
