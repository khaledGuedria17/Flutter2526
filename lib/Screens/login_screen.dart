import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgets/custom_button.dart';
import 'package:myapp/Screens/bottom_nav_screen.dart';
import 'package:myapp/Screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  //route
  static final String routeName = "/";
  //var
  var username = "";
  var password = "";
  GlobalKey<FormState> formKey = GlobalKey();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "S'authentifier",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 15,
            children: [
              //1
              Image.asset("assets/minecraft.jpg"),
              //2
              TextFormField(
                decoration: InputDecoration(hint: Text("Username")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username shopuld not be empty';
                  }
                },
                onSaved: (value) {
                  username = value!;
                },
              ),
              //3
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hint: Text("Password"),
                  suffixIcon: Icon(Icons.visibility),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password shopuld not be empty';
                  }
                },
                onSaved: (value) {
                  password = value!;
                },
              ),
              //4 : button
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    //print(username + " : " + password);
                    Navigator.pushReplacementNamed(
                      context,
                      BottomNavScreen.routeName,
                    );
                  }
                },
                child: CustomButton("S'authentifier", Colors.deepPurpleAccent),
              ),
              CustomButton("Créer un compte", Colors.red),
              //5
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                  //1
                  Text("Mot de passe oublié?"),
                  //2
                  Text(
                    "Cliquer Ici",
                    style: TextStyle(color: Colors.deepPurpleAccent),
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
