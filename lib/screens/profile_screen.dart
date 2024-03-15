
import 'package:flutter/material.dart';

import '../widgets/Profile/about_me_container.dart';
import '../widgets/Profile/name_container.dart';
import '../widgets/jobs/skills.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileNameContainer(
                icon: Icons.account_circle,
                userName: 'Name',
                role: "Student",
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "About me",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const AboutMeContainer(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Skills",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Wrap(
                  spacing: 6.0,
                  children: jobSkills([
                    "skill1",
                    "skill1",
                    "skill1",
                    "skill1",
                    "skill1",
                    "skill1",
                    "skill1",
                  ]),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Education",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "mfnvdkfjnvfjvfdv dfvjkfvf vmdfvkdfvd fkjbvd vfdn vv  vfjv fdvdfv djv dfv fdvjkdf vfv fv jf"),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Achievements",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "mfnvdkfjnvfjvfdv dfvjkfvf vmdfvkdfvd fkjbvd vfdn vv  vfjv fdvdfv djv dfv fdvjkdf vfv fv jf"),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Experience",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "mfnvdkfjnvfjvfdv dfvjkfvf vmdfvkdfvd fkjbvd vfdn vv  vfjv fdvdfv djv dfv fdvjkdf vfv fv jf")
            ],
          ),
        ),
      )
    );
  }


}
