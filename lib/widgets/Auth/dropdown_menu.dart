import 'package:flutter/material.dart';

class MyDropdownMenu extends StatefulWidget {
  @override
  _MyDropdownMenuState createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  String _selectedOption = 'Student'; // Default selected option

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedOption,
      onChanged: (String? newValue) {
        setState(() {
          _selectedOption = newValue!;
        });
      },
      items: <String>['Student', 'Recruiter', 'Mentor'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
              value,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal
            ),
          ),
        );
      }).toList(),
    );
  }
}
