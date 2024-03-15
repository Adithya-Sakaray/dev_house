import "package:flutter/material.dart";

class GroupDetailScreen extends StatefulWidget {
  const GroupDetailScreen({super.key});

  @override
  State<GroupDetailScreen> createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "group detail",
        ),
      ),
    );
  }
}
