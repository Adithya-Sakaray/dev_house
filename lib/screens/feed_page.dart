import 'dart:async';

import 'package:dev_house/widgets/feeds/professional_feed.dart';
import 'package:dev_house/widgets/feeds/recruiter_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/feeds/student_feed.dart';

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
  // late TabController _tabController;

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 2, vsync: this);
    // _tabController.addListener(_handleTabChange);
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {});
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {});
      }
    });
  }

  // void _handleTabChange() {
  //   setState(() {
  //     selectedTabIndex = _tabController.index;
  //   });
  //   widget.onTabIndexChange(selectedTabIndex);
  // }

  Future<void> _handleRefresh() async {
    // Implement your refresh logic here
    // For example, you can fetch new data from a network or update existing data
    await Future.delayed(const Duration(seconds: 2)); // Simulating a delay
    setState(() {
      // Update state after refresh
    });
  }

  bool ti = false;
  String text = "dfdsdsdvsdvsdvsbjvbsdjbvjsbvjsbdjvdssdvsdsdbsvjbd";
  String imageUrl = "assets/images/link.jpeg";
  bool likeb = false;
  int like = 0;
  bool showFullPost = false;

  @override
  Widget build(BuildContext context) {
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
            displayFeeds(selectedButtonIndexg),
          ],
        ),
      ),
    );
  }

  Widget displayFeeds(int index) {
    if (index == 0) {
      return const StudentFeed();
    } else if (index == 1) {
      return const ProfessionalFeed();
    } else {
      return const RecruiterFeed();
    }
  }
}
