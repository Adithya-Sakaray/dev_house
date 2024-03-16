import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../widgets/feeds/feed.dart';

class StudentFeed extends StatelessWidget {
  final RxList studentPosts;
  const StudentFeed({super.key, required this.studentPosts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: studentPosts.length,
        itemBuilder: (context, index) {
          return  feed(
            name: studentPosts[index]["userId"],
            profileType: studentPosts[index]["type"],
            content: studentPosts[index]["content"],
            likeb: false,
            like: studentPosts[index]["likes"],
            imageUrl: studentPosts[index]["imageUrl"],
          );
        },
      ),
    );
  }
}
