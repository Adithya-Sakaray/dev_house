import 'package:dev_house/screens/web_view.dart';
import 'package:dev_house/widgets/message_tile.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String pc = "Hari Ram";
  String cohort = "Cohort 1";
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: DefaultTabController(
        length: 2, // Number of tabs
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "Personal"),
                Tab(text: "Cohort"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebView(
                                        appBarTitle: "Jonita",
                                      )));
                        },
                        child: const MessageTile(
                          title: "Jonita",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebView(
                                        appBarTitle: "Samantha",
                                      )));
                        },
                        child: const MessageTile(
                          title: "Samantha",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebView(
                                        appBarTitle: "Rashmika",
                                      )));
                        },
                        child: const MessageTile(
                          title: "Rashmika",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebView(
                                        appBarTitle: "Disha",
                                      )));
                        },
                        child: const MessageTile(
                          title: "Disha",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebView(
                                        appBarTitle: "Trisha",
                                      )));
                        },
                        child: const MessageTile(
                          title: "Trisha",
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebView(
                                        appBarTitle: "Electrical",
                                      )));
                        },
                        child: const MessageTile(
                          title: "Electrical",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebView(
                                        appBarTitle: "Blockchain Cohort",
                                      )));
                        },
                        child: const MessageTile(
                          title: "Blockchain Cohort",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebView(
                                        appBarTitle: "Flutter",
                                      )));
                        },
                        child: const MessageTile(
                          title: "Flutter",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WebView(
                                        appBarTitle: "Web Cohort",
                                      )));
                        },
                        child: const MessageTile(
                          title: "Web Cohort",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
