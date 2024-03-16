import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class NewFeed extends StatefulWidget {
  const NewFeed({Key? key}) : super(key: key);

  @override
  _NewFeedState createState() => _NewFeedState();
}

class _NewFeedState extends State<NewFeed> {
  final TextEditingController _descriptionController = TextEditingController();
  int _descriptionMaxLength = 1000;
  bool _imageChosen = false; // Track if an image is chosen or not
  File? _imageFile;

  void _updateDescriptionCounter() {
    setState(() {
      _descriptionMaxLength = 1000 - _descriptionController.text.length;
    });
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _imageChosen = true; // Set to true when image is chosen
      });

      // Extract file name and extension
      String fileNameWithExtension = pickedFile.path.split('/').last;
      String fileName = fileNameWithExtension.split('.').first;
      String fileExtension = fileNameWithExtension.split('.').last;

      print(
          'Image Name: $fileName.$fileExtension'); // Print image name with extension
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 13,
        bottom: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
          const Padding(
            padding: EdgeInsets.only(
              left: 25,
              bottom: 15,
              top: 25,
            ),
            child: Text(
              'Create Post',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Center(
              child: SizedBox(
                height: 400,
                width: 350,
                child: TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    label: const Text('Description'),
                    counterText:
                        '${_descriptionController.text.length}/$_descriptionMaxLength',
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 12.0),
                  ),
                  onChanged: (_) {
                    _updateDescriptionCounter();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              _getImage();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              // color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      bottom: 10,
                    ),
                    child: Icon(
                      Icons.image_rounded,
                      size: 27,
                      color: _imageChosen ? Colors.green : Colors.black,
                    ),
                  ),
                  _imageChosen
                      ? const Padding(
                          padding: EdgeInsets.only(left: 3, bottom: 6),
                          child: Text(
                            'Image uploaded', // Display image name with extension
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(left: 3, bottom: 6),
                          child: Text(
                            "Choose image", // Display image name with extension
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 22.5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      return const Color.fromARGB(255, 7, 42, 240);
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                onPressed:
                    _descriptionController.text.isNotEmpty || _imageFile != null
                        ? () {
                            // Handle the submission logic here
                            Navigator.pop(context);
                          }
                        : null,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
