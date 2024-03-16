import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Utils/skill_set.dart';
import '../widgets/Auth/skill_chip.dart';

class NewJob extends StatefulWidget {
  const NewJob({Key? key}) : super(key: key);

  @override
  _NewJobState createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  File? _orgIcon; // Variable to store the selected organization icon

  Future<void> _pickIcon() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _orgIcon = File(pickedFile.path);
      });
    }
  }

  final PageController _pageController = PageController();
  int _currentPage = 0;
  final TextEditingController _orgNameController = TextEditingController();
  final TextEditingController _orgDescriptionController =
      TextEditingController();
  final TextEditingController _jobRoleController = TextEditingController();
  final TextEditingController _aboutGigController = TextEditingController();

  final List<String> _salaryRanges = [
    'Less than 3 LPA',
    '3-5 LPA',
    '6-12 LPA',
    'More than 12 LPA',
  ];

  final List<String> _jobTypes = [
    'Internship',
    'Full-Time',
    'Freelance',
    'Remote'
  ];

  final List<String> _locations = [
    'Mumbai',
    'Delhi',
    'Bangalore',
    'Kolkata',
    'Chennai',
    'Hyderabad',
    'Pune',
    'Ahmedabad',
    'Surat',
    'Jaipur',
    'Lucknow',
    'Kanpur',
    'Nagpur',
    'Visakhapatnam',
    'Indore',
    'Thane',
    'Bhopal',
    'Patna',
    'Vadodara',
  ];

  var noOfSkillsSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create gig",
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey[300],
              child: Row(
                children: List.generate(
                  2,
                  (index) => Expanded(
                    child: Container(
                      height: 4,
                      color: _currentPage == index
                          ? Colors.blue
                          : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildFirstPage(),
                  _buildSecondPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.grey.shade200,
        child: GestureDetector(
          onTap: () {
            if (_currentPage == 0 &&
                _orgDescriptionController.text.isNotEmpty &&
                _aboutGigController.text.isNotEmpty &&
                _aboutGigController.text.isNotEmpty) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else if (_jobRoleController.text.isNotEmpty &&
                _salaryRanges.isNotEmpty &&
                _jobTypes.isNotEmpty &&
                _locations.isNotEmpty &&
                noOfSkillsSelected > 0) {
              setState(() {
                Navigator.pop(context);
              });
            }
          },
          child: Container(
            color: Colors.grey.shade200,
            child: Center(
              child: _currentPage == 0
                  ? const Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )
                  : const Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Step 1',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _pickIcon,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: _orgIcon != null
                          ? ClipOval(
                              child: Image.file(
                                _orgIcon!,
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            )
                          : const Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.black54,
                            ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _orgNameController,
                    decoration:
                        const InputDecoration(labelText: 'Organisation Name'),
                  ),
                  TextFormField(
                    controller: _orgDescriptionController,
                    decoration: const InputDecoration(
                        labelText: 'Organisation Description'),
                  ),
                  TextField(
                    controller: _aboutGigController,
                    maxLines: 5,
                    decoration:
                        const InputDecoration(labelText: 'About the Gig'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondPage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Step 2',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 1),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _jobRoleController,
                    decoration: const InputDecoration(labelText: 'Job role '),
                  ),
                  DropdownButtonFormField<String>(
                    value: null,
                    items: _salaryRanges.map((salary) {
                      return DropdownMenuItem<String>(
                        value: salary,
                        child: Text(salary),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    decoration:
                        const InputDecoration(labelText: 'Compensarion'),
                  ),
                  DropdownButtonFormField<String>(
                    value: null,
                    items: _jobTypes.map((type) {
                      return DropdownMenuItem<String>(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    decoration: const InputDecoration(labelText: 'Job type'),
                  ),
                  DropdownButtonFormField<String>(
                    value: null,
                    items: _locations.map((location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                    onChanged: (value) {},
                    decoration: const InputDecoration(labelText: 'Location'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 13,
                      right: 315,
                      bottom: 7,
                    ),
                    child: Text(
                      "Skills",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 340,
                    child: ListView.builder(
                        itemCount: skillSet.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                skillSet[index]["title"].toString(),
                                style: const TextStyle(
                                    fontFamily: "PoppinsSemiBold",
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              const SizedBox(height: 5),
                              Wrap(
                                spacing: 10,
                                runSpacing: 5,
                                children: List.generate(
                                    skillSet[index]["skills"].length,
                                    (innerindex) => SkillChip(
                                          chipLabel: skillSet[index]["skills"]
                                              [innerindex],
                                          increaseNoOfSkills: () {
                                            setState(() {
                                              if (noOfSkillsSelected != 10) {
                                                noOfSkillsSelected++;
                                              }
                                            });
                                          },
                                          decreaseNoOfSkills: () {
                                            setState(() {
                                              if (noOfSkillsSelected != 0) {
                                                noOfSkillsSelected--;
                                              }
                                            });
                                          },
                                          getNumberOfItems: () =>
                                              noOfSkillsSelected,
                                        )),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
