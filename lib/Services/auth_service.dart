import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/Models/user.dart';
import 'package:myapp/Screens/bottom_nav_screen.dart';

class AuthService {
  //var
  String base_url = "scribo-1v5g.onrender.com";
  //register
  Future<void> addUser(User user, BuildContext context) async {
    Map<String, String> body = {
      "email": user.email,
      "password": user.password,
      "name": user.name,
      "role": user.role,
      "tier": user.tier,
    };
    Map<String, String> headers = {"Content-Type": "application/json"};

    var uri = Uri.https(base_url, "/auth/register");
    http.post(uri, body: json.encode(body), headers: headers).then((response) {
      print("Response == ${response.body}");
      if (response.statusCode == 201) {
        Navigator.pop(context);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Fail!"),
              content: Text("Something Wrong! Try again later."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    });
  }

  //login
  Future<void> login(User user, BuildContext context) async {
    Map<String, String> body = {"email": user.email, "password": user.password};
    Map<String, String> headers = {"Content-Type": "application/json"};

    var uri = Uri.https(base_url, "/auth/login");
    http.post(uri, body: json.encode(body), headers: headers).then((response) {
      if (response.statusCode == 201) {
        saveCurrentSession(User.toUser(response.body)).then((value) {
          Navigator.pushReplacementNamed(context, BottomNavScreen.routeName);
        });
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Login Fail!"),
              content: Text("Something Wrong! Verify your credentials."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    });
  }

  //Current Session
  Future<void> saveCurrentSession(User user) async {
    SharedPreferences.getInstance().then((sp) {
      sp.setString("currentUser", user.toJson());
    });
  }

  Future<User> getCurrentSession() async {
    var sp = await SharedPreferences.getInstance();
    return User.toUser(sp.getString("currentUser")!);
  }
}
