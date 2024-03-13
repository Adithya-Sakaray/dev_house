import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'dont_rec.dart';
import 'report.dart';

class MenuBottomSheet extends StatefulWidget {
  const MenuBottomSheet({Key? key}) : super(key: key);

  @override
  _MenuBottomSheetState createState() => _MenuBottomSheetState();
}

class _MenuBottomSheetState extends State<MenuBottomSheet> {
  // Variables to store the selected reason and warning state
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          child: const Divider(
            color: Colors.black,
            height: 32.5,
            thickness: 4,
            indent: 162.5,
            endIndent: 162.5,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16), // Adjust padding here
          leading: const Icon(Icons.share),
          title: const Text('Share via'),
          onTap: () {
            Navigator.pop(context);
            Share.share('Check out this awesome post!');
          },
        ),
        ListTile(
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16), // Adjust padding here
          leading: const Icon(Icons.not_interested),
          title: const Text('Don\'t recommend this post'),
          onTap: () {
            Navigator.pop(context);
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return FeedActionsDialog(
            //       onReasonSelected: (reason) {
            //         // Handle the selected reason here
            //         print('Selected reason: $reason');
            //       },
            //     );
            //   },
            // );
            _showRecommendationBottomSheet(context);
            // Handle don't recommend logic
          },
        ),
        ListTile(
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16), // Adjust padding here
          leading: const Icon(Icons.flag),
          title: const Text('Report the post'),
          onTap: () {
            Navigator.pop(context);
            _showReportBottomSheet(context);
            // Handle report logic
          },
        ),
        const SizedBox(
          height: 22.5,
        ),
      ],
    );
  }
}

void _showRecommendationBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (BuildContext context) {
      return const RecommendationBottomSheet();
    },
  );
}

void _showReportBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    builder: (BuildContext context) {
      return const ReportBottomSheet();
    },
  );
}
