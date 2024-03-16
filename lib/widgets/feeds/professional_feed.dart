import 'package:flutter/material.dart';

import 'feed.dart';

class ProfessionalFeed extends StatelessWidget {
  const ProfessionalFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (index, context) {
          return const feed(
            name: "hari",
            profileType: "Professional",
            content: "adfsdvsd",
            likeb: false,
            like: 0,
            // imageUrl: "assets/images/link.jpeg",
          );
        },
      ),
    );
  }
}
