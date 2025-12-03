import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/Models/game.dart';

class FavoritesService {
  //var box = Hive.box<Game>('gamesBox');

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(GameAdapter());
    await Hive.openBox<Game>("Favorites");
  }

  List<Game> getAll() {
    var box = Hive.box<Game>("Favorites");
    return box.values.toList();
  }

  void insert(Game game) async {
    var box = Hive.box<Game>("Favorites");
    box.put(game.name, game);
  }
}
