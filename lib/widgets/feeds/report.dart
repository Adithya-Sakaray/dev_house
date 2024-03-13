import 'package:flutter/material.dart';

class ReportBottomSheet extends StatefulWidget {
  const ReportBottomSheet({Key? key}) : super(key: key);

  @override
  _ReportBottomSheetState createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends State<ReportBottomSheet> {
  // Variables to store the selected reason and warning state
  List<String> selectedReasons = [];
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
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 25,
                  bottom: 15,
                ),
                child: Text(
                  'Report Post',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Transform.translate(
                offset:
                    const Offset(187.5, -8), // Adjust x and y values as needed
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
          const SizedBox(height: 7.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.5),
            child: Wrap(
              spacing: 8.0,
              children: [
                _buildReasonChip('Spam'),
                _buildReasonChip('Inappropriate'),
                _buildReasonChip('Misleading'),
                _buildReasonChip('Offensive'),
                _buildReasonChip('Irrelevant'),
                _buildReasonChip('Abusive'),
                _buildReasonChip('Already Reported'),
                _buildReasonChip('Other'),
              ],
            ),
          ),
          const SizedBox(height: 22.5),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'If you think this goes against our Professional\nCommunity Policies, please let us know.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                // color: Color.,
              ),
            ),
          ),
          const SizedBox(height: 17.5),
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
                      if (selectedReasons.isNotEmpty) {
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
                onPressed: selectedReasons.isNotEmpty
                    ? () {
                        // Handle the submission logic here
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

  Widget _buildReasonChip(String reason) {
    final bool isSelected = selectedReasons.contains(reason);
    return FilterChip(
      label: Text(reason),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            selectedReasons.add(reason);
          } else {
            selectedReasons.remove(reason);
          }
        });
      },
      selectedColor: const Color.fromARGB(255, 172, 183, 244),
      checkmarkColor: Colors.white,
      showCheckmark: true,
    );
  }
}
