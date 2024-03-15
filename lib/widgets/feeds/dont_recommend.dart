import 'package:flutter/material.dart';

class RecommendationBottomSheet extends StatefulWidget {
  const RecommendationBottomSheet({super.key});

  @override
  _RecommendationBottomSheetState createState() =>
      _RecommendationBottomSheetState();
}

class _RecommendationBottomSheetState extends State<RecommendationBottomSheet> {
  // Variables to store the selected reason and warning state
  String? selectedReason;

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

          Row(
            children: [
              const Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    bottom: 15,
                  ),
                  child: Text(
                    'Tell us why to help improve \nthe feed.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              Container(
                padding: const EdgeInsets.only(bottom: 37.5, left: 32.5),
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          // Options
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedReason = 'Reason 1';
                });
              },
              child: ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding:
                    EdgeInsets.zero, // Remove ListTile's default padding
                title: const Text('I\'m not interested in the author'),
                leading: Radio<String>(
                  value: 'Reason 1',
                  groupValue: selectedReason,
                  onChanged: (String? value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedReason = 'Reason 2';
                });
              },
              child: ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding:
                    EdgeInsets.zero, // Remove ListTile's default padding
                title: const Text('I\'m not interested in this topic'),
                leading: Radio<String>(
                  value: 'Reason 2',
                  groupValue: selectedReason,
                  onChanged: (String? value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedReason = 'Reason 3';
                });
              },
              child: ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding:
                    EdgeInsets.zero, // Remove ListTile's default padding
                title: const Text('I have seen too many posts on this topic'),
                leading: Radio<String>(
                  value: 'Reason 3',
                  groupValue: selectedReason,
                  onChanged: (String? value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedReason = 'Reason 4';
                });
              },
              child: ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding:
                    EdgeInsets.zero, // Remove ListTile's default padding
                title: const Text('I have seen this post before'),
                leading: Radio<String>(
                  value: 'Reason 4',
                  groupValue: selectedReason,
                  onChanged: (String? value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedReason = 'Reason 5';
                });
              },
              child: ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding:
                    EdgeInsets.zero, // Remove ListTile's default padding
                title: const Text('It\'s something else'),
                leading: Radio<String>(
                  value: 'Reason 5',
                  groupValue: selectedReason,
                  onChanged: (String? value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity, // Make the button span the entire width
              margin: const EdgeInsets.symmetric(
                  horizontal: 22.5), // Add margin for spacing
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (selectedReason != null) {
                        // Return the actual button color if a reason is selected
                        return const Color.fromARGB(255, 7, 42, 240);
                      } else {
                        // Return a light background color if no reason is selected
                        return const Color(0xFFE0E0E0);
                      }
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), // Adjust the border radius as needed
                    ),
                  ),
                ),
                onPressed: selectedReason != null
                    ? () {
                        // Handle the submission logic here
                        print('Selected reason: $selectedReason');
                        Navigator.pop(context); // Close the bottom sheet
                      }
                    : null,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 12.0), // Adjust vertical padding as needed
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white), // Adjust font size as needed
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
