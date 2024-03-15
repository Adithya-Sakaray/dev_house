import "package:flutter/material.dart";

class SharePostScreen extends StatefulWidget {
  const SharePostScreen({super.key});

  @override
  State<SharePostScreen> createState() => _SharePostState();
}

class _SharePostState extends State<SharePostScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Share Post"),
      ),
    );
  }
}
