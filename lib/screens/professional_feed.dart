import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../widgets/feeds/feed.dart';

class ProfessionalFeed extends StatelessWidget {
  final RxList professionalPosts;
  const ProfessionalFeed({super.key, required this.professionalPosts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: professionalPosts.length,
        itemBuilder: (context, index) {
          return  feed(
            name: professionalPosts[index]["userId"],
            profileType: professionalPosts[index]["type"],
            content: professionalPosts[index]["content"],
            likeb: false,
            like: professionalPosts[index]["likes"],
            imageUrl: professionalPosts[index]["imageUrl"],
          );
        },
      ),
    );
  }
}
