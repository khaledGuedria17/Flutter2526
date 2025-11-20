import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/bottom_nav_screen.dart';
import 'package:myapp/Screens/tabbar_screen.dart';

class CustomDrawer extends StatefulWidget {
  //var
  final bool isBottomNav;
  const CustomDrawer(this.isBottomNav, {super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("G-Store Esprit", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          //1
          ListTile(
            onTap: () {},
            title: Text("Modifier le profil"),
            leading: Icon(Icons.edit),
          ),
          //2
          widget.isBottomNav
              ? ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      TabbarScreen.routeName,
                    );
                  },
                  title: Text("Navigation du Haut"),
                  leading: Icon(Icons.upload),
                )
              : ListTile(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      BottomNavScreen.routeName,
                    );
                  },
                  title: Text("Navigation du bas"),
                  leading: Icon(Icons.download),
                ),
        ],
      ),
    );
  }
}
