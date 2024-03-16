import "package:dev_house/Controller/event_controller.dart";
import "package:dev_house/Controller/feed_page_controller.dart";
import "package:dev_house/Controller/job_controller.dart";
import "package:dev_house/screens/home_screen.dart";
import "package:dev_house/screens/login_or_register_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";

class LoginChecker  extends StatelessWidget {
  final bool loggedIn;
  const LoginChecker ({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    Get.put(FeedPageController());
    Get.put(JobController());
    Get.put(EventController());

    return Scaffold(
      body: checkLogin(),
    );
  }

  Widget checkLogin()  {
    if(loggedIn){
      return const HomeScreen();
    } else {
      return const LoginOrRegisterScreen();
    }
  }
}