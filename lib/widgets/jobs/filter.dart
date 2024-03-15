import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> categories = [
    'Domain',
    'Skills',
    'Compensation',
    'Role type',
    'Location'
  ];
  String selectedCategory = 'Domain'; // Default selected category
  late List<dynamic> options; // Options for the selected category
  late TextEditingController searchController;
  late List<bool> checkboxStates;
  List<dynamic> getOptionsForCategory(String category) {
    // Implement logic to fetch options based on the selected category
    // For demo purposes, returning dummy options
    if (category == 'Domain') {
      return [
        "Software Development",
        "Data Science and Analytics",
        "Cybersecurity",
        "Cloud Computing",
        "Artificial Intelligence and Machine Learning",
        "Web Development",
        "Mobile App Development",
        "Network Administration",
        "Database Management",
        "IT Consulting",
        "Healthcare",
        "Education",
        "Finance",
        "Marketing and Advertising",
        "Sales and Business Development",
        "Human Resources",
        "Engineering",
        "Retail and E-commerce",
        "Hospitality and Tourism",
        "Legal Services"
      ];
    } else if (category == 'Skills') {
      return [
        "Java",
        "Python",
        "JavaScript",
        "Data Analysis and Visualization",
        "Network Security",
        "AWS",
        "Azure",
        "Google Cloud",
        "Machine Learning Algorithms",
        "React",
        "Angular",
        "Vue.js",
        "Flutter",
        "React Native",
        "Firebase",
        "SQL",
        "NoSQL",
        "IT Infrastructure Management",
        "DevOps Practices",
        "Communication Skills",
        "Problem Solving",
        "Leadership",
        "Teamwork",
        "Time Management",
        "Customer Service",
        "Negotiation",
        "Adaptability",
        "Critical Thinking",
        "Decision Making",
        "Organization",
        "Research",
        "Analytical Skills",
        "Financial Management",
        "Project Management"
      ];
    } else if (category == 'Compensation') {
      return [
        {"title": "Equity Split", "subtitle": "Get a stake in the company"},
        {"title": "Project Basis", "subtitle": "Earn for completing a project"},
        {"title": "Monthly", "subtitle": "Earn a monthly stipend"},
        {"title": "Yearly", "subtitle": "Earn an annual salary"}
      ];
    } else if (category == 'Role type') {
      return ['Intern', 'Freelancer', 'Full-time'];
    } else if (category == 'Location') {
      return ['On-site', "Remote"];
    } else {
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize options with the options for the default selected category
    options = getOptionsForCategory(selectedCategory);
    searchController = TextEditingController();
    searchController.addListener(() {
      getFilteredOptions(searchController.text);
    });
    checkboxStates = List<bool>.generate(options.length, (index) => false);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.translate(
          offset: const Offset(-12, 0), // Adjust the X and Y offset as needed
          child: const Text(
            'Filter',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left partition for categories
          Container(
            width: 136,
            color: Colors.grey.shade200, // Left partition color
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  color: selectedCategory == categories[index]
                      ? Colors.white
                      : null,
                  child: ListTile(
                    title: Text(
                      categories[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedCategory = categories[index];
                        // Update options based on selected category
                        options = getOptionsForCategory(selectedCategory);
                        // Reset checkbox states
                        checkboxStates = List<bool>.generate(
                            options.length, (index) => false);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Right partition for options
          Expanded(
            child: Container(
              color: Colors.white, // Right partition color
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  selectedCategory == "Domain" || selectedCategory == "Skills"
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: 2,
                            left: 11.5,
                            right: 13.0,
                            bottom: 6.5,
                          ),
                          child: Container(
                            height: 47.5,
                            padding: const EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200], // Light background color
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Row(
                              children: [
                                Transform.translate(
                                  offset: const Offset(2,
                                      1.6), // Adjust the X and Y offset as needed
                                  child: const Icon(
                                    Icons.search,
                                    size: 23,
                                    color: Colors.grey,
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                      controller: searchController,
                                      decoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.5,
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                            left: 8, top: 27),
                                        hintText: 'Search',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        fillColor: Colors.blueGrey[50],
                                        filled: true,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          options = getFilteredOptions(value);
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        if (options[index] is String) {
                          return ListTile(
                            title: Text(
                              options[index],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Checkbox(
                              value: false, // Implement logic for checking
                              onChanged: (bool? value) {
                                setState(() {
                                  // Update the state of the checkbox
                                  checkboxStates[index] = value!;
                                });
                              },
                            ),
                            onTap: () {
                              setState(() {
                                // Handle tap event if needed
                              });
                            },
                          );
                        } else {
                          return ListTile(
                            title: Text(
                              options[index]["title"],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              options[index]["subtitle"],
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 11.5,
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Checkbox(
                              value: false, // Implement logic for checking
                              onChanged: (bool? value) {
                                setState(() {
                                  // Update the state of the checkbox
                                  checkboxStates[index] = value!;
                                });
                              },
                            ),
                            onTap: () {
                              setState(() {
                                // Handle tap event if needed
                              });
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.5),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(12.5),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ), // Adjust border radius as needed
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0), // Adjust padding as needed
                    child: Center(
                      child: Text(
                        'Clear all',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black, // Text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.5),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 61),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 7, 42, 240), // Background color
                    borderRadius: BorderRadius.circular(
                        12.5), // Adjust border radius as needed
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0), // Adjust padding as needed
                    child: Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<dynamic> getFilteredOptions(String query) {
    if (query.isEmpty) {
      // If the query is empty, return all options
      return options;
    } else {
      // Filter options based on the current query
      return options.where((option) {
        if (option is String) {
          return option.toLowerCase().contains(query.toLowerCase());
        } else {
          return option["title"].toLowerCase().contains(query.toLowerCase());
        }
      }).toList();
    }
  }
}
