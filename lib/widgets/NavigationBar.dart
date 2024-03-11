import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Color selectedColor;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.selectedColor,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      unselectedFontSize: 9,
      selectedFontSize: 9,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 25,
            width: 25,
            child: selectedIndex == 0
                ? Image.asset("assets/ff.png", color: selectedColor)
                : Image.asset("assets/fo.png", color: Colors.grey.shade900),
          ),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 30,
            width: 28,
            child: selectedIndex == 1
                ? Image.asset("assets/pf.png", color: selectedColor)
                : Image.asset("assets/po.png", color: Colors.grey.shade900),
          ),
          label: 'Projects',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 30,
            width: 28,
            child: selectedIndex == 2
                ? Image.asset("assets/jf.png", color: selectedColor)
                : Image.asset("assets/jo.png", color: Colors.grey.shade900),
          ),
          label: 'Jobs',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 30,
            width: 28,
            child: selectedIndex == 3
                ? Image.asset("assets/ef.png", color: selectedColor)
                : Image.asset("assets/eo.png", color: Colors.grey.shade900),
          ),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 4
              ? SizedBox(
                  height: 32,
                  width: 36,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromARGB(255, 7, 42, 240),
                        width: 2.0,
                      ),
                    ),
                    child: Image.asset("assets/p1.png"),
                  ),
                )
              : SizedBox(
                  height: 30,
                  width: 36,
                  child: Image.asset("assets/p1.png"),
                ),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: selectedColor,
      unselectedItemColor: Colors.grey.shade700,
      type: BottomNavigationBarType.fixed,
      onTap: onItemTapped,
    );
  }
}
