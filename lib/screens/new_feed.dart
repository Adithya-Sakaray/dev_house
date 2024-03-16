import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class NewFeed extends StatefulWidget {
  const NewFeed({super.key});

  @override
  _NewFeedState createState() => _NewFeedState();
}

class _NewFeedState extends State<NewFeed> {
  // Variables to store the selected reason and warning state

  final TextEditingController _descriptionController = TextEditingController();
  int _descriptionMaxLength = 1000;

  void _updateDescriptionCounter() {
    setState(() {
      _descriptionMaxLength = 1000 - _descriptionController.text.length;
    });
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 13,
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
              height: 22,
              thickness: 4,
              indent: 165,
              endIndent: 165,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                    bottom: 15,
                    top: 25,
                  ),
                  child: Text(
                    'Create Post',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          // Options
          Expanded(
            child: Center(
              child: SizedBox(
                height: 400,
                width: 350, // Set the desired height for the TextArea
                child: TextField(
                  controller: _descriptionController,
                  maxLines: null, // Allows unlimited lines
                  minLines: 5, // Set the minimum number of lines
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    label: const Text('Description'),

                    counterText:
                        '${_descriptionController.text.length}/$_descriptionMaxLength',
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 12.0),
                    // Customize other InputDecoration properties as needed
                  ),
                  onChanged: (_) {
                    _updateDescriptionCounter();
                  },
                ),
              ),
            ),
          ),
          // const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(
              left: 320,
              bottom: 12.5,
            ),
            child: IconButton(
              onPressed: () {
                _getImage();
              },
              icon: const Icon(
                Icons.image_rounded,
                size: 30,
                color: Colors.black,
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
                onPressed: _descriptionController.text.isNotEmpty
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
}
