import 'package:dev_house/screens/feed_page.dart';
import 'package:dev_house/screens/group_feed_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/groups/customTile_G.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  int selectedButtonIndexg = 0;
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
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
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
                        'All groups',
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
                        'My groups',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              selectedButtonIndexg == 0
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GroupFeedScreen()));
                            },
                            child: const CustomTile_G(
                              title: 'Design',
                              subtitle: '34554' " members",
                              description:
                                  'Talk, vibe, relax, repeat. Do whatever you',
                            ),
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FeedPage()));
                            },
                            child: const CustomTile_G(
                              title: 'Finance',
                              subtitle: '2354' " members",
                              description:
                                  'Talk, vibe, relax, repeat. Do whatever you',
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
