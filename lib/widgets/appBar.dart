import "package:flutter/material.dart";

import "../pages/MessagesPage.dart";
import "../pages/NotificationsPage.dart";
import "../pages/SearchPage.dart";

AppBar app(BuildContext context) {
  return AppBar(
    title: const Text(
      'MentHer',
      style: TextStyle(fontWeight: FontWeight.w600),
    ),
    actions: [
      IconButton(
        icon: SizedBox(
          height: 24,
          width: 24,
          child: Image.asset("assets/s.png"),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchPage()),
          );
        },
      ),
      IconButton(
        icon: SizedBox(
          height: 24,
          width: 24,
          child: Image.asset("assets/n.png"),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NotificationsPage()),
          );
        },
      ),
      IconButton(
        icon: SizedBox(
          height: 25,
          width: 24,
          child: Image.asset("assets/c.png"),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MessagesPage()),
          );
        },
      ),
    ],
  );
}
