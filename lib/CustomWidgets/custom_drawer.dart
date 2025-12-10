import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/bottom_nav_screen.dart';
import 'package:myapp/Screens/favorites_screen.dart';
import 'package:myapp/Screens/login_screen.dart';
import 'package:myapp/Screens/tabbar_screen.dart';
import 'package:myapp/Services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: FutureBuilder(
          future: AuthService().getCurrentSession(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.name,
                style: TextStyle(color: Colors.white),
              );
            } else {
              return LinearProgressIndicator();
            }
          },
        ),
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
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, FavoritesScreen.routeName);
            },
            title: Text("Favorites"),
            leading: Icon(Icons.favorite_border_outlined),
          ),
          ListTile(
            onTap: () {
              SharedPreferences.getInstance().then((sp) {
                sp.clear().then((value) {
                  Navigator.pushReplacementNamed(
                    context,
                    LoginScreen.routeName,
                  );
                });
              });
            },
            title: Text("Logout", style: TextStyle(color: Colors.red)),
            leading: Icon(Icons.logout, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
