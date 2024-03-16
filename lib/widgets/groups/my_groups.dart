import 'package:flutter/material.dart';

import '../../screens/group_feed_screen.dart';
import 'customTile_G.dart';

class MyGroups extends StatelessWidget {
  const MyGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GroupFeedScreen()));
            },
            child: const CustomTile_G(
              title: 'Design',
              subtitle: '34554' " members",
              description: 'Talk, vibe, relax, repeat. Do whatever you',
            ),
          );
        },
      ),
    );
  }
}
