import 'package:flutter/material.dart';
import 'package:myapp/Models/game.dart';
import 'package:myapp/Services/favorites_service.dart';

class DetailsScreen extends StatefulWidget {
  //routes
  static final String routeName = "/Details";
  //var
  var counter = 3000;
  var isLike = false;
  late Game currentGame;
  DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    widget.currentGame = ModalRoute.of(context)!.settings.arguments as Game;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.currentGame.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: () {
              FavoritesService().insert(widget.currentGame);
              setState(() {
                widget.isLike = true;
              });
            },
            icon: widget.isLike
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 25,
          children: [
            //1
            Image.network(widget.currentGame.image),
            //2
            Text(widget.currentGame.description),
            //3
            Column(
              children: [
                Text(
                  "${widget.currentGame.price} TND",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text("Nombre d'exemplaire disponible : ${widget.counter}"),
              ],
            ),
            ElevatedButton.icon(
              //style: ButtonStyle(backgroundColor: Colors.deepPurpleAccent),
              onPressed: () {
                setState(() {
                  widget.counter--;
                });
              },
              label: Text("Acheter"),
              icon: Icon(Icons.shopping_bag),
            ),
          ],
        ),
      ),
    );
  }
}
