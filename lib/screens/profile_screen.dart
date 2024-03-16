import 'package:flutter/material.dart';
import '../widgets/Profile/about_me_container.dart';
import '../widgets/Profile/name_container.dart';
import '../widgets/jobs/skills.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> profileData = {
      'name': 'Abhishek',
      'email': "abhishek24@gmail.com",
      'role': 'Student',
      'aboutMe': 'I am a passionate student interested in technology and programming.',
      'skills': [
        'React JS',
        'Flutter',
        'GCP',
        'Solana'
        // Add more skills as needed
      ],
      'education': 'Bachelor of Science in Computer Science - XYZ University',
      'achievements': 'Winner of the Coding Competition 2020.',
      'experience': 'Internship at ABC Company (2021)',
    };

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileNameContainer(
                icon: Icons.account_circle,
                userName: profileData['name'],
                role: profileData['role'],
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
              AboutMeContainer(
                  email: profileData['email'],
                  description: profileData['aboutMe']),
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
                  children: jobSkills(profileData['skills']),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Education",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                profileData['education'],
              ),
              const SizedBox(height: 15,),

              const Text(
                "Achievements",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                profileData['achievements'],
              ),
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
              Text(
                profileData['experience'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
