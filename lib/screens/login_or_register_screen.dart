import "package:dev_house/screens/register_screen.dart";
import "package:flutter/material.dart";
import "login_screen.dart";

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen(
      {super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  bool showLoginScreen = true;
  void changeScreen() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen == true) {
      return LoginScreen(
        changeScreen: changeScreen,
      );
    } else {
      return SignupScreen(
        changeScreen: changeScreen,
      );
    }
  }
}