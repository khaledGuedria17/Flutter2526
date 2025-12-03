import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgets/custom_home_card.dart';
import 'package:myapp/Screens/details_screen.dart';
import 'package:myapp/Services/favorites_service.dart';

class FavoritesScreen extends StatefulWidget {
  //route
  static final String routeName = "/Favorites";
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    var favorites = FavoritesService().getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: favorites[index],
              );
            },
            child: CustomHomeCard(favorites[index]),
          );
        },
      ),
    );
  }
}
