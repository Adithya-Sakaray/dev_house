import "package:dev_house/Utils/theme.dart";
import "package:dev_house/screens/home_screen.dart";
import "package:flutter/material.dart";
import "../Utils/skill_set.dart";
import "../widgets/Auth/button_component.dart";
import "../widgets/Auth/signup_progress.dart";
import "../widgets/Auth/skill_chip.dart";

class SkillSelectionScreen extends StatefulWidget {
  SkillSelectionScreen({super.key});

  @override
  State<SkillSelectionScreen> createState() => _SkillSelectionScreenState();
}

class _SkillSelectionScreenState extends State<SkillSelectionScreen> {
  var noOfSkillsSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // ignore: avoid_unnecessary_containers
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const SignupPageProgessIndicator(fillColor: purpleColor),
                        const SignupPageProgessIndicator(fillColor: purpleColor),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Tell us about your skills",
                      style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          fontSize: 25,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Which skills are you good at or interested in learning? Pick at least 1️⃣",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 450,
                      child: ListView.builder(
                          itemCount: skillSet.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  skillSet[index]["title"].toString(),
                                  style: const TextStyle(
                                      fontFamily: "PoppinsSemiBold",
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 5),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 5,
                                  children: List.generate(
                                      skillSet[index]["skills"].length,
                                          (innerindex) => SkillChip(
                                        chipLabel: skillSet[index]["skills"]
                                        [innerindex],
                                        increaseNoOfSkills: () {
                                          setState(() {
                                            if (noOfSkillsSelected != 10) {
                                              noOfSkillsSelected++;
                                            }
                                          });
                                        },
                                        decreaseNoOfSkills: () {
                                          setState(() {
                                            if (noOfSkillsSelected != 0) {
                                              noOfSkillsSelected--;
                                            }
                                          });
                                        },
                                        getNumberOfItems: () =>
                                        noOfSkillsSelected,
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            );
                          }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$noOfSkillsSelected / 10 selected",
                          style: const TextStyle(
                              fontFamily: "PoppinsSemiBold",
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const ButtonComponent(text: "Get Started")),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}