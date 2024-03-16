import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feed.dart';

class RecruiterFeed extends StatelessWidget {
  final RxList recruiterPosts;
  const RecruiterFeed({super.key, required this.recruiterPosts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: recruiterPosts.length,
        itemBuilder: (context, index) {
          return  feed(
            name: recruiterPosts[index]["userId"],
            profileType: recruiterPosts[index]["type"],
            content: recruiterPosts[index]["content"],
            likeb: false,
            like: recruiterPosts[index]["likes"],
            imageUrl: recruiterPosts[index]["imageUrl"],
          );
        },
      ),
    );
  }
}
