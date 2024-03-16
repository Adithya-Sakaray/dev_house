import "package:flutter/material.dart";

import "../screens/web_view.dart";
import "../screens/search_screen.dart";

AppBar app(BuildContext context, int selectedIndex) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: selectedIndex == 0
        ? const Text(
            'MentHer',
            style: TextStyle(fontWeight: FontWeight.w600),
          )
        : selectedIndex == 1
            ? const Text(
                ' Groups',
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            : selectedIndex == 2
                ? const Text(
                    ' Jobs',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                : selectedIndex == 3
                    ? const Text(
                        ' Events',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    : const Text(
                        ' Profile',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
    actions: [
      selectedIndex == 0
          ? IconButton(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset("assets/icons/app_bar/search.png"),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
            )
          : const SizedBox.shrink(),
      selectedIndex == 4
          ? IconButton(
              icon: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Icon(
                  Icons.logout,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            )
          : const SizedBox(),
      selectedIndex == 0
          ? IconButton(
              icon: SizedBox(
                height: 25,
                width: 24,
                child: Image.asset("assets/icons/app_bar/message.png"),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WebView()),
                );
              },
            )
          : const SizedBox(),
    ],
  );
}
