import 'package:flutter/material.dart';

enum SortOption {
  Relevance,
  Latest,
}

class RelevanceBottomSheet extends StatefulWidget {
  final void Function(SortOption) updateSelectedOption; // Add this parameter

  const RelevanceBottomSheet({Key? key, required this.updateSelectedOption})
      : super(key: key);

  @override
  _RelevanceBottomSheetState createState() => _RelevanceBottomSheetState();
}

class _RelevanceBottomSheetState extends State<RelevanceBottomSheet> {
  String? selectedReason;
  SortOption selectedSortOption = SortOption.Relevance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 25,
        // left: 5,
        // right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Padding for the title
          GestureDetector(
            child: const Divider(
              color: Colors.black,
              height: 15,
              thickness: 4,
              indent: 175,
              endIndent: 175,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 25,
              bottom: 15,
            ),
            child: Text(
              'Sort',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          const SizedBox(height: 2.5),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: ListTile(
                    title: const Text(
                      'Relevance',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: selectedSortOption == SortOption.Relevance
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      setState(() {
                        print("Relevance tapped");
                        selectedSortOption = SortOption.Relevance;
                      });
                      widget.updateSelectedOption(selectedSortOption);
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Divider(
                  thickness: 0.5,
                  indent: 22.5,
                  endIndent: 22.5,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: ListTile(
                    title: const Text(
                      'Latest',
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: selectedSortOption == SortOption.Latest
                        ? const Icon(Icons.check)
                        : null,
                    onTap: () {
                      setState(() {
                        print("Latest tapped");
                        selectedSortOption = SortOption.Latest;
                      });
                      widget.updateSelectedOption(selectedSortOption);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 7.5),
        ],
      ),
    );
  }
}
