import 'dart:math';

import 'package:flutter/material.dart';

class CustomTile_G extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final VoidCallback onPressed;

  const CustomTile_G({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomTileState createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile_G> {
  bool showFullDescription = false;
  late Color randomColor;

  @override
  void initState() {
    super.initState();
    randomColor = _getRandomColor();
  }

  Color _getRandomColor() {
    final List<Color> lightColors = [
      Colors.grey[300]!, // Light Grey
      Colors.teal[100]!, // Teal
      Colors.amber[100]!, // Amber
      Colors.lightGreen[200]!, // Light Green
      Colors.pink[100]!, // Pink
      Colors.cyan[100]!, // Cyan
      Colors.deepOrange[100]!, // Deep Orange
      Colors.indigo[100]!, // Indigo
      Colors.lime[300]!, // Lime
      Colors.blue[100]!, // Blue
      Colors.purple[100]!, // Purple
    ];

    List<Color> darkerColors = [
      Colors.grey[400]!, // Light Grey
      Colors.teal[200]!, // Teal
      Colors.amber[200]!, // Amber
      Colors.lightGreen[300]!, // Light Green
      Colors.pink[200]!, // Pink
      Colors.cyan[200]!, // Cyan
      Colors.deepOrange[200]!, // Deep Orange
      Colors.indigo[200]!, // Indigo
      Colors.lime[400]!, // Lime
      Colors.blue[200]!, // Blue
      Colors.purple[200]!, // Purple
    ];

    // Randomly select a light color index
    final int randomIndex = _getRandomIndex(lightColors.length);

    // Get the corresponding light color
    final Color lightColor = lightColors[randomIndex];

    // Get the corresponding darker color
    final Color darkerColor = darkerColors[randomIndex];

    // Update the background color for the profile picture
    setState(() {
      profilePictureBackgroundColor = darkerColor;
    });

    return lightColor;
  }

  int _getRandomIndex(int max) {
    return Random().nextInt(max);
  }

  late Color profilePictureBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: randomColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile Picture Container
              Container(
                margin: const EdgeInsets.only(
                  left: 8,
                  top: 8,
                  bottom: 8,
                ),
                width: 42.5,
                height: 42.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      profilePictureBackgroundColor, // Change to your desired color or image
                ),
                // You can add profile picture here
              ),
              const SizedBox(
                  // width: 40,
                  ),
              // Text Content Container
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 10,
                    bottom: 5.4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.3,
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 13.3,
                        ),
                      ),
                      const SizedBox(height: 8), // Adjust as needed
                    ],
                  ),
                ),
              ),

              // Button Container
              Container(
                margin: const EdgeInsets.only(top: 4.0, right: 4),
                child: ElevatedButton(
                  onPressed: widget.onPressed,
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: const Text(
                    "Join",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showFullDescription = !showFullDescription;
                });
              },
              child: Text(
                showFullDescription
                    ? widget.description
                    : _getDisplayDescription(), // Calling _getDisplayDescription here
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getDisplayDescription() {
    const maxCharactersToShow = 35;
    if (widget.description.length <= maxCharactersToShow) {
      return widget.description;
    } else {
      return '${widget.description.substring(0, maxCharactersToShow)}... see more';
    }
  }
}
