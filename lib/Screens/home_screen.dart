import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgets/custom_home_card.dart';
import 'package:myapp/Models/game.dart';
import 'package:myapp/Screens/details_screen.dart';

class HomeScreen extends StatelessWidget {
  //route
  static final String routeName = "/Home";
  //var
  var games = [
    Game("assets/dmc5.jpg", "Devil May Cry 5", 180),
    Game("assets/fifa.jpg", "FIFA22", 150),
    Game("assets/minecraft.jpg", "Minecraft", 90),
    Game("assets/nfs.jpg", "NFS Heat", 200),
    Game("assets/rdr2.jpg", "Red Dead Redemption 2", 240),
    Game("assets/re8.jpg", "Resident Evil 8", 210),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //print(games[index].name);
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(games[index]),
                ),
              ); */

              Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: games[index],
              );
            },
            child: CustomHomeCard(games[index]),
          );
        },
      ),
    );
  }
}
