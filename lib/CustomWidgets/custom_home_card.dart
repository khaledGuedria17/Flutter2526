import 'package:flutter/material.dart';
import 'package:myapp/Models/game.dart';

class CustomHomeCard extends StatelessWidget {
  //var
  final Game game;

  const CustomHomeCard(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(game.image, height: 100),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 100, child: Text(game.name)),
                  Text(
                    "${game.price} TND",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
