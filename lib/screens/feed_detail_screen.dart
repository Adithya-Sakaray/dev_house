import 'package:flutter/material.dart';

class FeedDetailScreen extends StatefulWidget {
  const FeedDetailScreen({super.key});

  @override
  State<FeedDetailScreen> createState() => _FeedDetailState();
}

class _FeedDetailState extends State<FeedDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Feed Detail'),
      ),
    );
  }
}
