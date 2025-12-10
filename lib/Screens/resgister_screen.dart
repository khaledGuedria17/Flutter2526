import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/CustomWidgets/custom_button.dart';
import 'package:myapp/Models/user.dart';
import 'package:myapp/Screens/bottom_nav_screen.dart';
import 'package:myapp/Screens/home_screen.dart';
import 'package:myapp/Services/auth_service.dart';
import 'package:myapp/Services/games_service.dart';

class ResgisterScreen extends StatefulWidget {
  //route
  static final String routeName = "/Register";

  ResgisterScreen({super.key});

  @override
  State<ResgisterScreen> createState() => _ResgisterScreenState();
}

class _ResgisterScreenState extends State<ResgisterScreen> {
  //var
  var username = "";
  var email = "";
  var password = "";

  GlobalKey<FormState> formKey = GlobalKey();

  //states
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "S'enregistrer",
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
                decoration: InputDecoration(hint: Text("Email")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email should not be empty';
                  }
                },
                onSaved: (value) {
                  email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hint: Text("Username")),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username should not be empty';
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
                    return 'Password should not be empty';
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
                    print(email + " : " + username + " : " + password);
                    AuthService().addUser(
                      User(email, username, password, "student", "regular"),
                      context,
                    );
                  }
                },
                child: CustomButton("Créer un compte", Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
