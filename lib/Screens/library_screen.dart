import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgets/custom_library_card.dart';
import 'package:myapp/Models/game.dart';
import 'package:myapp/Services/games_service.dart';

class LibraryScreen extends StatelessWidget {
  //route
  static final String routeName = "/Library";
  //var
  var games = [
    /* Game("assets/dmc5.jpg", "Devil May Cry 5", 180),
    Game("assets/fifa.jpg", "FIFA22", 150),
    Game("assets/minecraft.jpg", "Minecraft", 90),
    Game("assets/nfs.jpg", "NFS Heat", 200),
    Game("assets/rdr2.jpg", "Red Dead Redemption 2", 240),
    Game("assets/re8.jpg", "Resident Evil 8", 210), */
  ];

  LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: GamesService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return CustomLibraryCard(snapshot.data![index]);
                },
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
