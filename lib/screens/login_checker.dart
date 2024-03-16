import "package:dev_house/screens/home_screen.dart";
import "package:dev_house/screens/login_or_register_screen.dart";
import "package:flutter/material.dart";

class LoginChecker  extends StatelessWidget {
  final bool loggedIn;
  const LoginChecker ({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: checkLogin(),
    );
  }

  Widget checkLogin() {
    if(loggedIn){
      return const HomeScreen();
    } else {
      return const LoginOrRegisterScreen();
    }
  }
}