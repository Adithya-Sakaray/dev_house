import 'package:dev_house/widgets/NavigationBar.dart';
import 'package:dev_house/widgets/drawer.dart';
import 'package:dev_house/widgets/floating.dart';
import 'package:flutter/material.dart';
import 'EventsPage.dart';
import '../widgets/feeds/FeedPage.dart';
import 'JobsPage.dart';
import 'ProfilePage.dart';
import 'ProjectsPage.dart';
import '../widgets/appBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavIndex = 0;
  int _selectedTabIndex = 0;
  final Color _selectedColor = const Color.fromARGB(255, 7, 42, 240);

  void _onItemTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app(
        context,
        _selectedNavIndex,
      ),
      drawer: _selectedNavIndex == 0
          ? draw(
              context,
            )
          : null,
      body: _selectedNavIndex == 0
          ? FeedPage(
              onTabIndexChange: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            )
          : _selectedNavIndex == 1
              ? const ProjectsPage()
              : _selectedNavIndex == 2
                  ? JobsPage(
                      onTabIndexChange: (index) {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                    )
                  : _selectedNavIndex == 3
                      ? const EventsPage()
                      : _selectedNavIndex == 4
                          ? const ProfilePage()
                          : Container(),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedNavIndex,
        selectedColor: _selectedColor,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: float(
        context,
        _selectedNavIndex,
        _selectedTabIndex,
      ),
    );
  }
}
