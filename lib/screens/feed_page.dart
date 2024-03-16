import 'dart:async';

import 'package:dev_house/Controller/feed_page_controller.dart';
import 'package:dev_house/screens/professional_feed.dart';
import 'package:dev_house/screens/recruiter_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'student_feed.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({
    Key? key,
  }) : super(key: key);
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with SingleTickerProviderStateMixin {
  int selectedButtonIndex = 0;
  int selectedButtonIndexg = 0;
  int selectedTabIndex = 0;

  Future<void> _handleRefresh() async {
    // Implement your refresh logic here
    // For example, you can fetch new data from a network or update existing data
    await Future.delayed(const Duration(seconds: 2)); // Simulating a delay
    setState(() {
      // Update state after refresh
    });
  }


  @override
  Widget build(BuildContext context) {
    final FeedPageController feedPageController = Get.find<FeedPageController>();
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 4.0,
                right: 4.0,
                bottom: 4.70,
              ),
              margin: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 13,
                    height: 35,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButtonIndexg = 0;
                      });
                      _handleRefresh();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButtonIndexg == 0
                          ? const Color.fromARGB(255, 211, 233, 251)
                          : Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(0, 35),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Student',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 13.5),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButtonIndexg = 1;
                      });
                      _handleRefresh();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButtonIndexg == 1
                          ? const Color.fromARGB(255, 211, 233, 251)
                          : Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(0, 35),
                      elevation: 0, // Remove the elevation shadow
                    ),
                    child: const Text(
                      'Professional',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 13.5),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButtonIndexg = 2;
                      });
                      _handleRefresh();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButtonIndexg == 2
                          ? const Color.fromARGB(255, 211, 233, 251)
                          : Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(0, 35),
                      elevation: 0, // Remove the elevation shadow
                    ),
                    child: const Text(
                      'Recruiter',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // if (selectedButtonIndex == 0) const StudentFeed(),
            // if (selectedButtonIndex == 1) const ProfessionalFeed(),
            // if (selectedButtonIndex == 2) const RecruiterFeed(),
            displayFeeds(selectedButtonIndexg, feedPageController.studentPost, feedPageController.professionalPost, feedPageController.recruiterPost),
          ],
        ),
      ),
    );
  }

  Widget displayFeeds(int index,RxList studentPosts,RxList professionalPosts, RxList recruiterPosts) {
    if (index == 0) {
      return  StudentFeed(studentPosts: studentPosts,);
    } else if (index == 1) {
      return  ProfessionalFeed(professionalPosts: professionalPosts);
    } else {
      return  RecruiterFeed(recruiterPosts: recruiterPosts,);
    }
  }
}
