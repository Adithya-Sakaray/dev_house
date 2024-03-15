import 'package:dev_house/screens/job_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTile_J extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;

  const CustomTile_J({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
  }) : super(key: key);

  @override
  _CustomTileState createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile_J> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const JobDetailScreen(),
            ),
          );
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15.5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          // color: const Color.fromARGB(255, 167, 173, 205),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profile Picture Container
                Container(
                  margin: const EdgeInsets.only(
                    left: 8,
                    top: 4.2,
                  ),
                  width: 21.5,
                  height: 27.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .grey.shade200, // Change to your desired color or image
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 9.5,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Text(
                      "Hari Ram",
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 11, right: 7.5),
                  child: Text(
                    "5d ago",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 9.5,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Text(
                      "Full-Stack Developer Intern for a Music-Tech AI Startup",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 11,
                    right: 10,
                  ),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    color: Colors
                        .grey.shade200, // Change to your desired color or image
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 5,
                left: 8.0,
                right: 8.0,
              ),
              child: Text(
                "Soundverse AI",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 8,
                  ),
                  // padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      // color: Colors.yellow.shade50,
                      color: const Color.fromARGB(
                          255, 170, 206, 172), // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.5, horizontal: 6.2),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 238, 239, 226), // Button background color
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/icons/job_tile/wal.png",
                            height: 16.5,
                            width: 16.5,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            '₹10000 - ₹15000/Project',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 7),
                      decoration: BoxDecoration(
                        color: Colors.white, // Button background color
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'Monthly',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
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
