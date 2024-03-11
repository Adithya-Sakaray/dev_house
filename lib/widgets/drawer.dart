import 'package:flutter/material.dart';

Drawer draw(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: const Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update UI based on item 1 selection
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update UI based on item 2 selection
          },
        ),
        // Add more list items as needed
      ],
    ),
  );
}
