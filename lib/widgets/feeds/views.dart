import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewsBottomSheet extends StatefulWidget {
  const ViewsBottomSheet({Key? key}) : super(key: key);

  @override
  _ViewsBottomSheetState createState() => _ViewsBottomSheetState();
}

class _ViewsBottomSheetState extends State<ViewsBottomSheet> {
  // Variables to store the selected reason and warning state
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          child: const Divider(
            color: Colors.black,
            height: 32.5,
            thickness: 4,
            indent: 175,
            endIndent: 175,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 27.5,
            bottom: 12.5,
          ),
          child: Text(
            'Views',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        const SizedBox(height: 7.5),
        Padding(
          padding: const EdgeInsets.only(left: 27.5),
          child: RichText(
            text: TextSpan(
              text: 'Times this post was seen. To learn more, see\nthe ',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.5,
                color: Colors.black, // Set the default text color
              ),
              children: [
                TextSpan(
                  text: 'Documentation.',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.5,
                    color: Color.fromARGB(
                        255, 7, 42, 240), // Set the color for "Documentation"
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      final Uri uri = Uri.parse(
                          'https://github.com/hariram62/dev_house'); // Replace with your documentation URL
                      launchUrl(
                        uri,
                      );
                    },
                ),
                // You can add more TextSpans if needed
              ],
            ),
          ),
        ),
        const SizedBox(height: 19),
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
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
