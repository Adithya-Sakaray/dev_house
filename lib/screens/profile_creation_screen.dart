import "package:dev_house/Utils/theme.dart";
import "package:dev_house/screens/skill_selection_screen.dart";
import "package:dev_house/widgets/Auth/text_field_component.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

import "../widgets/Auth/button_component.dart";
import "../widgets/Auth/signup_progress.dart";

class ProfileCreationScreen extends StatelessWidget {
  ProfileCreationScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SignupPageProgessIndicator(fillColor: purpleColor),
                      SignupPageProgessIndicator(
                          fillColor: greyColor),
                      SignupPageProgessIndicator(
                          fillColor: greyColor),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Welcome User!",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        fontSize: 35,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Let's build your profile together 👋",
                    style: TextStyle(
                        fontFamily: "PoppinsRegular",
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Stack(children: [
                      const Icon(Icons.account_circle, size: 95,),

                    ]),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Full name",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "PoppinsRegular",
                        fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  TextFieldComponent(
                      hintText: "John Watson",
                      obscureText: false,
                      controller: usernameController,
                      keyboardType: TextInputType.name
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Phone number",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "PoppinsRegular",
                        fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  TextFieldComponent(
                      hintText: "8010055699",
                      obscureText: false,
                      controller: phonenumberController,
                      keyboardType: TextInputType.phone
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SkillSelectionScreen()));
                      },
                      child: const ButtonComponent(text: "Next"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}