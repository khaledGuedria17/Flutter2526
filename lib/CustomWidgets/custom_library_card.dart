import 'package:flutter/material.dart';
import 'package:myapp/Models/game.dart';

class CustomLibraryCard extends StatefulWidget {
  //var
  late Game game;
  CustomLibraryCard(this.game, {super.key});

  @override
  State<CustomLibraryCard> createState() => _CustomLibraryCardState();
}

class _CustomLibraryCardState extends State<CustomLibraryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(widget.game.image, height: 80),
            Text(widget.game.name),
            Text("${widget.game.price} TND"),
          ],
        ),
      ),
    );
  }
}
