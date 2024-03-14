import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> categories = ['Domain', 'Skills', 'Compensation', 'Role type'];
  String selectedCategory = 'Domain'; // Default selected category
  List<String> options = []; // Options for the selected category

  @override
  void initState() {
    super.initState();
    // Initialize options with the options for the default selected category
    options = getOptionsForCategory(selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left partition for categories
          Container(
            width: 150,
            color: Colors.grey.shade200, // Left partition color
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    categories[index],
                    style: TextStyle(
                      color: selectedCategory == categories[index]
                          ? Colors.blue // Change color of selected filter
                          : Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index];
                      // Update options based on selected category
                      options = getOptionsForCategory(selectedCategory);
                    });
                  },
                );
              },
            ),
          ),
          // Right partition for options
          Expanded(
            child: Container(
              color: Colors.white, // Right partition color
              child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(options[index]),
                    value: false, // Implement logic for checking
                    onChanged: (bool? value) {
                      setState(() {
                        // Update the state of the checkbox
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // Clear all filters
              },
              child: const Text('Clear all'),
            ),
            TextButton(
              onPressed: () {
                // Apply filters
              },
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to get options based on selected category
  List<String> getOptionsForCategory(String category) {
    // Implement logic to fetch options based on the selected category
    // For demo purposes, returning dummy options
    if (category == 'Domain') {
      return ['Option 1', 'Option 2', 'Option 3'];
    } else if (category == 'Skills') {
      return ['Option A', 'Option B', 'Option C'];
    } else if (category == 'Compensation') {
      return ['Option X', 'Option Y', 'Option Z'];
    } else if (category == 'Role type') {
      return ['Option i', 'Option ii', 'Option iii'];
    } else {
      return [];
    }
  }
}
