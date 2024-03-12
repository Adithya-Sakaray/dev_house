import "package:flutter/material.dart";

import "../pages/MessagesPage.dart";
import "../pages/NotificationsPage.dart";
import "../pages/SearchPage.dart";

AppBar app(BuildContext context, int selectedIndex) {
  return AppBar(
    title: selectedIndex == 0
        ? const Text(
            'MentHer',
            style: TextStyle(fontWeight: FontWeight.w600),
          )
        : selectedIndex == 1
            ? const Text(
                'Projects',
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            : selectedIndex == 2
                ? const Text(
                    'Jobs',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                : selectedIndex == 3
                    ? const Text(
                        'Events',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    : const Text(
                        'Profile',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
    actions: [
      selectedIndex == 0 || selectedIndex == 1 || selectedIndex == 2
          ? IconButton(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset("assets/icons/appbar/s.png"),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
            )
          : const SizedBox.shrink(),
      selectedIndex == 4
          ? IconButton(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset("assets/icons/appbar/s.png"),
              ),
              onPressed: () {},
            )
          : IconButton(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset("assets/icons/appbar/n.png"),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsPage()),
                );
              },
            ),
      selectedIndex == 4
          ? IconButton(
              icon: SizedBox(
                height: 25,
                width: 24,
                child: Image.asset("assets/icons/appbar/s.png"),
              ),
              onPressed: () {},
            )
          : IconButton(
              icon: SizedBox(
                height: 25,
                width: 24,
                child: Image.asset("assets/icons/appbar/c.png"),
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
