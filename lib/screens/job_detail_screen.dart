import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';

import '../widgets/jobs/skills.dart';

class JobDetailScreen extends StatefulWidget {
  final String companyName;
  final String role;
  final Int? salary;
  final String type;
  final String location;
  final List<dynamic> skills;
  final String jobDesc;
  final String companyDesc;

  const JobDetailScreen(
      {Key? key,
      required this.companyName,
      required this.role,
      this.salary,
      required this.type,
      required this.location,
      required this.skills,
      required this.jobDesc,
      required this.companyDesc})
      : super(key: key);

  @override
  State<JobDetailScreen> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetailScreen> {
  late List<String> skillList;

  @override
  void initState() {
    super.initState();
    // Convert widget.skills to list of strings
    skillList = widget.skills.map((element) => element.toString()).toList();
  }

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
              radius: 52.5,
              // Adjust the radius to change the size of the profile picture
              backgroundColor: Colors.grey,
              // backgroundImage: AssetImage('assets/images/pp.jpg'),
            ),
            const SizedBox(height: 12),
            // Company name
            Text(
              widget.companyName,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Job role
            Text(
              widget.role,
              style: const TextStyle(
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
                children:
                    skillList.map((skill) => Chip(label: Text(skill))).toList(),
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
                          "assets/icons/job_tile/wal.png",
                          height: 20,
                          width: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.salary == null ? "Salary" : "${widget.salary}",
                          style: const TextStyle(
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
                        "assets/icons/job_tile/int.png",
                        height: 20,
                        width: 20,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.type,
                        style: const TextStyle(
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
                        "assets/icons/job_tile/loc.png",
                        height: 20,
                        width: 20,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.location,
                        style: const TextStyle(
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
                height: 30,
                thickness: 7,
                indent: 0,
                endIndent: 0,
              ),
            ),
            const SizedBox(height: 5),

            // Job description
            const Text(
              'ABOUT THE GIG',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.jobDesc,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 25),

            const Text(
              'Company Description',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.companyDesc,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 15),
            // Apply button
            ElevatedButton(
              onPressed: () {
                // Add functionality to apply for the job
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 7, 42, 240),
                ),
              ),
              child: const Text(
                'Apply Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
