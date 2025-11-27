import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgets/custom_home_card.dart';
import 'package:myapp/Models/game.dart';
import 'package:myapp/Screens/details_screen.dart';
import 'package:myapp/Services/games_service.dart';

class HomeScreen extends StatefulWidget {
  //route
  static final String routeName = "/Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //var
  var games = [
    /* Game("assets/dmc5.jpg", "Devil May Cry 5", 180),
    Game("assets/fifa.jpg", "FIFA22", 150),
    Game("assets/minecraft.jpg", "Minecraft", 90),
    Game("assets/nfs.jpg", "NFS Heat", 200),
    Game("assets/rdr2.jpg", "Red Dead Redemption 2", 240),
    Game("assets/re8.jpg", "Resident Evil 8", 210), */
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: GamesService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments: snapshot.data![index],
                    );
                  },
                  child: CustomHomeCard(snapshot.data![index]),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
