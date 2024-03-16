import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/feeds/feed.dart';

class FeedPage extends StatefulWidget {
  final void Function(int) onTabIndexChange;

  const FeedPage({Key? key, required this.onTabIndexChange}) : super(key: key);
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int selectedButtonIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

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
    return Scaffold(
      body: RefreshIndicator(
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
                          selectedButtonIndex = 0;
                        });
                        _handleRefresh();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedButtonIndex == 0
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
                          selectedButtonIndex = 1;
                        });
                        _handleRefresh();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedButtonIndex == 1
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
                          selectedButtonIndex = 2;
                        });
                        _handleRefresh();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedButtonIndex == 2
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
              if (selectedButtonIndex == 0)
                const feed(
                    name: "hari",
                    profileType: "Student",
                    content: "fdsdfsdfvsdvsdvsvsdvsdvsdvsv",
                    imageUrl: "assets/images/link.jpeg",
                    likeb: false,
                    like: 0),
              if (selectedButtonIndex == 1)
                const feed(
                    name: "hari",
                    profileType: "Professional",
                    content: "fdsdfsdfvsdvsdvsvsdvsdvsdvsv",
                    imageUrl: "assets/images/link.jpeg",
                    likeb: false,
                    like: 0),
              if (selectedButtonIndex == 2)
                const feed(
                    name: "hari",
                    profileType: "Recruiter",
                    content: "fdsdfsdfvsdvsdvsvsdvsdvsdvsv",
                    imageUrl: "assets/images/link.jpeg",
                    likeb: false,
                    like: 0),
            ],
          ),
        ),
      ),
    );
  }
}
