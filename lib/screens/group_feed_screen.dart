import "package:dev_house/screens/feed_page.dart";
import "package:flutter/material.dart";

class GroupFeedScreen extends StatelessWidget {
  const GroupFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groups Feed"),
      ),
      body: const FeedPage(),
    );
  }
}
