import 'package:flutter/material.dart';

class NewFeed extends StatefulWidget {
  const NewFeed({super.key});

  @override
  State<NewFeed> createState() => _NewPostState();
}

class _NewPostState extends State<NewFeed> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int _titleMaxLength = 50;
  int _descriptionMaxLength = 1000;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(_updateTitleCounter);
    _descriptionController.addListener(_updateDescriptionCounter);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateTitleCounter() {
    setState(() {
      // Update title counter
      _titleMaxLength = 50 - _titleController.text.length;
    });
  }

  void _updateDescriptionCounter() {
    setState(() {
      // Update description counter
      _descriptionMaxLength = 1000 - _descriptionController.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start a discussion'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              maxLength: 50,
              decoration: InputDecoration(
                labelText: 'Title',
                counterText: '${_titleController.text.length}/$_titleMaxLength',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              maxLength: 1000,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: 'Description',
                counterText:
                    '${_descriptionController.text.length}/$_descriptionMaxLength',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // Add image functionality
                  },
                  icon: const Icon(Icons.image),
                  tooltip: 'Add Image',
                ),
                IconButton(
                  onPressed: () {
                    // Add video functionality
                  },
                  icon: const Icon(Icons.video_library),
                  tooltip: 'Add Video',
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Submit post functionality
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
