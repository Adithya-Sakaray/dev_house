import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';

class JobDetail extends StatefulWidget {
  const JobDetail({super.key});

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, top: 3),
            child: IconButton(
              icon: const Icon(
                Icons.share_outlined,
                // size: 22,
              ),
              onPressed: () {
                Share.share('Check out this gig!');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius:
                  52.5, // Adjust the radius to change the size of the profile picture
              backgroundColor: Colors.grey,
              // backgroundImage: AssetImage('assets/images/pp.jpg'),
            ),
            const SizedBox(height: 12),
            // Company name
            const Text(
              'Techvortexx',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Job role
            const Text(
              'Graphic Designer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Row of skills chips
            Center(
              child: Wrap(
                spacing: 6.0,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(0, 32.5),
                      elevation: 0, // Remove the elevation shadow
                    ),
                    child: const Text(
                      'Java',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(0, 32.5),

                      elevation: 0, // Remove the elevation shadow
                    ),
                    child: const Text(
                      'AWS',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(0, 32.5),

                      elevation: 0, // Remove the elevation shadow
                    ),
                    child: const Text(
                      'React',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(0, 32.5),
                      elevation: 0, // Remove the elevation shadow
                    ),
                    child: const Text(
                      'Flutter',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minimumSize: const Size(0, 32.5),
                      elevation: 0, // Remove the elevation shadow
                    ),
                    child: const Text(
                      'Firebase',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Row of job details
            Container(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 15.5),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                // color: const Color.fromARGB(255, 167, 173, 205),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/wal.png",
                          height: 20,
                          width: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          'Monthly',
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                    child: VerticalDivider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/icons/int.png",
                        height: 20,
                        width: 20,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Intern",
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 44,
                    child: VerticalDivider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/icons/loc.png",
                        height: 20,
                        width: 20,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Remote",
                        style: TextStyle(
                          fontSize: 9,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.zero,
              child: Divider(
                color: Colors.grey.shade200,
                height: 20,
                thickness: 7,
                indent: 0,
                endIndent: 0,
              ),
            ),
            // Job description
            const Text(
              'Job Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Ut eu lorem nec justo interdum sodales vel sit amet libero.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Posted by
            const Text(
              'Posted by Company Name',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Apply button
            ElevatedButton(
              onPressed: () {
                // Add functionality to apply for the job
              },
              child: const Text('Apply Now'),
            ),
          ],
        ),
      ),
    );
  }
}
