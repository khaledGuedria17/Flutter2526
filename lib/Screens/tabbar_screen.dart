import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgets/custom_drawer.dart';
import 'package:myapp/Screens/cart_screen.dart';
import 'package:myapp/Screens/home_screen.dart';
import 'package:myapp/Screens/library_screen.dart';

class TabbarScreen extends StatefulWidget {
  //route
  static final String routeName = "/Tabbar";
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  //var
  var screens = [HomeScreen(), LibraryScreen(), CartScreen()];
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("G-Store Esprit", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurpleAccent,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home_outlined), text: "Home"),
              Tab(icon: Icon(Icons.bookmark_border), text: "Library"),
              Tab(icon: Icon(Icons.shopping_bag_outlined), text: "Cart"),
            ],
          ),
        ),
        body: TabBarView(children: screens),
        drawer: Drawer(child: CustomDrawer(false)),
      ),
    );
  }
}
