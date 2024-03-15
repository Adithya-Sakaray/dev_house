import "package:flutter/material.dart";

class SharePost extends StatefulWidget {
  const SharePost({super.key});

  @override
  State<SharePost> createState() => _SharePostState();
}

class _SharePostState extends State<SharePost> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Share Post"),
      ),
    );
  }
}
