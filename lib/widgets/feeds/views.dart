import 'package:flutter/material.dart';

class ViewsBottomSheet extends StatefulWidget {
  const ViewsBottomSheet({Key? key}) : super(key: key);

  @override
  _ViewsBottomSheetState createState() => _ViewsBottomSheetState();
}

class _ViewsBottomSheetState extends State<ViewsBottomSheet> {
  // Variables to store the selected reason and warning state
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
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 25,
                  bottom: 15,
                ),
                child: Text(
                  'Views',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7.5),
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
                      return const Color.fromARGB(255, 7, 42, 240);
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30), // Adjust the border radius as needed
                    ),
                  ),
                ),
                onPressed: () {
                  // Handle the submission logic here
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 12.0), // Adjust vertical padding as needed
                  child: Text(
                    'Dismiss',
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
