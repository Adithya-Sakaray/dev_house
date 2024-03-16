// ignore_for_file: avoid_unnecessary_containers, must_be_immutable
import "package:dev_house/screens/profile_creation_screen.dart";
import "package:dev_house/widgets/Auth/dropdown_menu.dart";
import "package:flutter/material.dart";
import "../Utils/theme.dart";
import "../widgets/Auth/button_component.dart";
import "../widgets/Auth/text_field_component.dart";


class SignupScreen extends StatelessWidget {
  void Function()? changeScreen;
  SignupScreen(
      {super.key,
        required this.changeScreen});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 35,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Please sign up.",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    const Text(
                      "Enjoy the app power to the fullest!",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          fontSize: 15,
                          color: greyColor),
                    ),
                    const SizedBox(height: 50),
                    TextFieldComponent(
                        hintText: "Email",
                        obscureText: false,
                        controller: emailController,
                        keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldComponent(
                        hintText: "Password",
                        obscureText: true,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldComponent(
                      hintText: "Confirm Password",
                      obscureText: true,
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyDropdownMenu(),
                      ],
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () async {
                        // Handle auth
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileCreationScreen()));
                      },
                      child: const ButtonComponent(
                        text: "Sign Up",
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "By clicking on sign up, you agree to MentHer's",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    const Text(
                      "Terms and Conditions of Use",
                      style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 100),
                    Center(
                      child: GestureDetector(
                        onTap: changeScreen,
                        child: const Column(
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontFamily: "PoppinsRegular",
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                            Text(
                              "Log In",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "PoppinsSemiBold",
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}