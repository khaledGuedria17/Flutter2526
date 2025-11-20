import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgets/custom_drawer.dart';
import 'package:myapp/Screens/cart_screen.dart';
import 'package:myapp/Screens/home_screen.dart';
import 'package:myapp/Screens/library_screen.dart';

class BottomNavScreen extends StatefulWidget {
  //route
  static final String routeName = "/BottomNav";

  BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  //var
  var screens = [HomeScreen(), LibraryScreen(), CartScreen()];

  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("G-Store Esprit", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: screens[counter],
      drawer: Drawer(child: CustomDrawer(true)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: counter,
        onTap: (value) {
          setState(() {
            counter = value;
          });
        },
        items: [
          //1
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          //2
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: "Library",
          ),
          //3
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
