import "package:flutter/material.dart";

class OthersProfile extends StatefulWidget {
  const OthersProfile({super.key});

  @override
  State<OthersProfile> createState() => _OthersProfileState();
}

class _OthersProfileState extends State<OthersProfile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Others Profile"),
      ),
    );
  }
}
